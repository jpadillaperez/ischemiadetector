function [pteup,posup,ptedown,posdown,pteup2,posup2]=pendcalc(position,sinal,dibujando,method_pendcalc,fa,se,seg)
% % Calculo de las pendientes de subida (QR) y bajada (RS) latido a latido 
% % (En position ya se han redefinido nQ y nS en funcion de si se ha
% detectado picos de Q y S o no)
if nargin<3
    dibujando=0;
end

numlat=length(position.R);     % DANIEL:  numlat se iguala a la cantidad de ptos R detectados 
pteup=nan(1,numlat); ptedown=pteup; pteup2=pteup;
posup = pteup; posdown=pteup; posup2=pteup;

% % Busqueda del punto de maxima pendiente en la parte de subida del QRS (nU) y  
% % de maxima pendiente en la parte de subida del QRS (nD)
% % ............................................................................
tamano=round(14*fa/1000);     % % tamano es duracion - 1 expresado en muestras para el entorno donde se realiza el analisis
if method_pendcalc==1
    sinal2 = filt_lowpass(sinal); % Low pass filtering for acurate detection of the derivative maxima/minima
    dersinal=gradient(sinal2);      % % derivada de la señal
    sinalutil=abs(dersinal); 
    sinal = sinal2;
end

% % CALCULO DE LAS RECTAS QUE AJUSTAN UN ENTORNO DE 15 ms ALREDEDOR DE nU:
% % ..............................................................................................
% % En la siguiente linea seleccionamos aquellos latidos donde estan determinadas las posiciones de Q y R:
% % Solo medimos la  pendiente de subida del QRS sobre tales latidos:
ind=find((~isnan(position.Q))&(~isnan(position.R)));

if dibujando==1
    figure();    %subplot(1,seg,se),
    hold on; 
    plot(sinal);  % xlim([82850 83100]);  ylim([-800 800]);
    plot(position.Q(ind),sinal(position.Q(ind)),'c*')
end

% aux_t = 0:1/1000:(numel(sinal)-1)/1000;
% sinal50 = sin(2*pi*50*aux_t);
if ~isempty(ind)
    for bj=1:length(ind)  % para cada latido
        j=ind(bj);
        if position.Q(j) < position.R(j)
            [~,posup(j)]=max(position.Q(j):position.R(j)); %DANIEL: busca maximo entre nQ y nR
            xup=posup(j)+position.Q(j)-1;       %DANIEL: suma posicion de nQ + posup siendo xup, posicion original nU
            vectorx=xup-round(tamano/2):1:xup+round(tamano/2)+0;  % DANIEL : vectorx es el tramo de 15 ms
            
            if method_pendcalc==1
                % % Aseguramos que el ajuste no se realiza sobre un intervalo con puntos por debajo de nQ o por encima de nR:
                ee=find(vectorx<position.Q(j) | vectorx>position.R(j)); vectorx(ee)=[];
                vectory=sinal(vectorx);           % DANIEL: puntos de la señal a ajustar
                aux=polyfit(vectorx,vectory,1);   % DANIEL: minimos cuadrados, aux contiene los coefcientes de la recta
                pteup(j)=aux(1);                  % DANIEL:  aux(1)=> pendiente y aux(2)=> corte del eJe Y
            end
            % % ----------------
            if dibujando==1
                hold on;
                if method_pendcalc==1; plot(vectorx,aux(1)*vectorx+aux(2),'g','LineWidth',2);
                    plot(position.Q(j)+posup(j)-1,sinal(position.Q(j)+posup(j)-1),'k.','MarkerSize',16);
                    %             plot(position.QRSon(j):1:position.QRSoff(j)+1,sinal(position.S(j))-50,'k');
                    %             plot(position.QRSoff(j),sinal(position.S(j))-50:sinal(position.QRSoff(j)),'k');
                    %             plot(position.QRSon(j),[sinal(position.S(j))-50:sinal(position.QRSoff(j))],'k');
                end
            end
            posup(j) = posup(j) + position.Q(j) - 1;
        end
    end
else
    pteup = [];
    posup = [];
end


% % CALCULO DE LAS RECTAS QUE AJUSTAN UN ENTORNO DE 15 ms ALREDEDOR DE nD:
% % ..............................................................................................
% % En la siguiente linea seleccionamos aquellos latidos donde estan determinadas las posiciones de R y S:
% % Solo medimos la  pendiente de bajada del QRS sobre tales latidos:
ind=find((~isnan(position.R))&(~isnan(position.S)));

if dibujando==1
   ddd=  4;  
   plot(position.R(ind),sinal(position.R(ind)),'k*')
   plot(position.S(ind),sinal(position.S(ind)),'m*')
   %plot(position.QRSoff(ind),sinal(position.QRSoff(ind)),'r*')
end

if ~isempty(ind)
    for bj=1:length(ind)  %para cada latido
        j=ind(bj);
        if position.R(j) < position.S(j)
            [~,posdown(j)]=max(position.R(j):position.S(j));
            xdown=posdown(j)+position.R(j)-1;
            vectorx=xdown-round(tamano/2):1:xdown+round(tamano/2)+0;
            
            if method_pendcalc==1
                % % Aseguramos que el ajuste no se realiza sobre un intervalo con puntos por debajo de nR o por encima de nS:
                ee=find(vectorx<position.R(j) | vectorx>position.S(j)); vectorx(ee)=[];
                vectory=sinal(vectorx);
                aux=polyfit(vectorx,vectory,1);
                ptedown(j)=aux(1);
            end
            % % ----------------
            if dibujando==1
                hold on;
                if method_pendcalc==1; plot(vectorx,aux(1)*vectorx+aux(2),'r','LineWidth',2);
                    plot(position.R(j)+posdown(j)-1,sinal(position.R(j)+posdown(j)-1),'k.','MarkerSize',16);
                    %plot(position.QRSon(j),sinal(position.QRSon(j)),'k.','MarkerSize',16);
                end
            end
            posdown(j) = posdown(j) + position.R(j) - 1;
        end
    end
else
    ptedown = [];
    posdown = [];
end

ind=find((~isnan(position.S))&(~isnan(position.QRSoff)));
    
% Calculo de la 3ra pendiente del QRS
if ~isempty(ind)
    for bj=1:length(ind)-1  %para cada latido
        j=ind(bj);
        if position.S(j) < position.QRSoff(j)
            [~,posup2(j)]=max(position.S(j):position.QRSoff(j));
            xup2=posup2(j)+position.S(j)-1;
            vectorx2=xup2-round(tamano/2):1:xup2+round(tamano/2)+0;
            
            if method_pendcalc==1
                % % Aseguramos que el ajuste no se realiza sobre un intervalo con puntos por debajo de nR o por encima de nS:
                ee=find(vectorx2<position.S(j) | vectorx2>position.QRSoff(j)); vectorx2(ee)=[];
                vectory2=sinal(vectorx2);
                aux=polyfit(vectorx2,vectory2,1);
                pteup2(j)=aux(1);
            end
            % % ----------------
            if dibujando==1
                hold on;
                if method_pendcalc==1; plot(vectorx2,aux(1)*vectorx2+aux(2),'y','LineWidth',2);
                    plot(position.S(j)+posup2(j)-1,sinal(position.S(j)+posup2(j)-1),'k.','MarkerSize',16);
                end
            end
            posup2(j) = posup2(j) + position.S(j) - 1;
        end
    end
else %Alex: Si la pendiente no se puede calcular, se saca vacía.
    pteup2 = [];
    posup2 = [];
end

end

%xlim([1600 1750])
% subplot(212), plot(dersinal); hold on, xlim([82850 83100]);  ylim ([-100 100]); set(gcf,'Position', [579 307 404 641])
% plot(position.R(ind),dersinal(position.R(ind)),'k.','MarkerSize',16)
% xlim([1600 1750])