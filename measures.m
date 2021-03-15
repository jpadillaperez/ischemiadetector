function [timebeats,st,qt,qd,ta,tp]=measures(dirhea,dirsig,dirann,anot1,anot2,ecgnr,typerec,leadsele,t,bas_flag,basltype,baz_flag,rej_flag,brlim,nbo_flag);

% ----  Measures Principal program  ----
% 
%  function [timebeats,st,qt,qd,ta,tp]= measures(dirhea,dirsig,dirann,anot1,anot2,ecgnr,typerec,leadsele,t,bas_flag,basltype,baz_flag,rej_flag,brlim,nbo_flag);
%
%  Estimation of different indexes measurements 
%
% Input parameter:
%   dirhea:  header directory
%   dirsig:  signal directory
%   dirann:  annotator directory
%   anot:   annotator name
%   ecgnr:   record name   
%   typerec:  type of recording  (0:MIT-DB or ESC-STT format, 1:Lund-Siemens format)
%   leadsele: type of leads (1: 12 standard leads 2: XYZ sysntesized)
%   t:  time interval 
%   bas_flag: baseline rejection (0:not applied 1:applied)
%   basltype: type of baseline rejection (1:cubic splines 2:IIR filtering)
%   baz_flag: Bazett's correction (0:not applied 1:applied)
%   rej_flag: rejection of beats with excess of baseline (0:not applied 1:applied)
%   brlim: maximum of excess of baseline (in microvolts) for the beats to be removed
%   nbo_flag: rejection of non-normal beats and neighbours (0:not applied 1:applied)
%
% Output parameter:
%   timebeats:  vector with positions of each beat (each ST level measure)
%   st: st level in microvolts  
%
% Copyright (c), Jose Garcia Moros & Pablo Laguna, Zaragoza University, Spain
% email: jogarmo@posta.unizar.es
% last revision: 22th Sep 1997
nlat=20; % number of beats to be processed each processing segment
toption=1;  % ---- save qrs positions ----
dref1=30*ones(1,9);
dref2=60*ones(1,9);
dref3=300*ones(1,9);
dref4=400*ones(1,9);
 
% ----  Paths definition  ----
matdir='C:/Users/Jorge/Desktop/';
basdir='';

if typerec==1   %%ESTO NO ES MI TIPO DE ARCHIVO
   % ----  staff3 definition variables  ----
   [hd,hdstr]=getecghd(dirsig,ecgnr);
   heasig.freq=hd(3);
   heasig.nsamp=hd(7);
   heasig.nsig=hd(6);  
end
%%no_leads=heasig.nsig; COMENTADO POR MI (ME DA QUE ESO IBA DENTRO DEL IF)

% ----  Reading of header, annotation and signal files for DB record  ----
if typerec==0 heasig=readheader([dirhea ecgnr '.hea']); %%ESTO ES PARA MI TIPO DE ARCHIVO
heasig.gain=heasig.gain(1); end
if isempty(t)  t=[1 heasig.nsamp-0.1*heasig.freq];  end %%POR SI NO PONES EL INTERVALO DE TIEMPO (que no lo pone en el ejemplo)

anname=[dirann anot1  '_' ecgnr '.mat'];                        %ESTO CARGA LOS PU_ Y TIENE QUE EXISTIR
if (exist(anname)==2), 
  eval(['load ' anname]);
else display('cannot find annotator'); return
end
annot=final;
%annot=annot';
%if (typerec==1 & leadsele==1), 
%   annot(10)=annot(9);
%   annot(11)=annot(9);
%   annot(12)=annot(9);
%end

qrsan=readannot([dirann ecgnr '.' anot2],t); %ESTO CARGA LOS .ARI
 
if typerec==0 fid=opensig(dirsig,heasig); end %PARA MI TIPO DE ARCHIVO
rname=[matdir ecgnr '_st'];
%datname=[matdir ecgnr '_st']; fst=fopen(datname,'wb');
no_leads=heasig.nsig;   %%POR ESTO, EL OTRO EST�? COMENTADO
 
% ----  Removing of non-QRS annotations  ----
if (exist(anname)==2), qrsan=isqrs(qrsan,heasig,t); end

% ----  Removing of first beat  ----
%if (annot.time(1)<0.5*heasig.freq) annot(1)=[]; end

if isempty(qrsan.time), disp('no events detected'), return, end
no_beats=length(qrsan.time);

% ----  RR interval  ----
rr=diff(qrsan.time);
 
% ----  Removing of non NORMAL labeled beats and adjacents ----
if nbo_flag==1
  [qrsan,rr]=isnormal(qrsan,heasig,t,rr);
  no_beats=length(qrsan.time); 
end

% ----  Nots times for cubic spline baseline wander removing  ----
notstime=qrsan.time-round(80*heasig.freq/1000);
if (notstime(1)<=0), notstime(1)=1; end;

% ----  Removing of beats with excess of baseline ----
if rej_flag==1
  bast=zeros(5,no_leads);
  bas=zeros(length(notstime),no_leads);
  for v=1:length(notstime)
    if typerec==0
      bast=getvec(fid,heasig,notstime(v),notstime(v)+5)./heasig.gain*1000; %%%%%AQUI HE HECHO UN CAMBIO EN LA FUNCION GETVEC PORQUE SI NO HAY 9 FID SEÑALANDO AL MISMO ARCHIVO Y NO FUNCIONA
      bas(v,:)=mean(bast');
    end
    if typerec==1      
      bast=(getecg(dirsig,ecgnr,[notstime(v),notstime(v)+4],[1:no_leads]))'; 
      bas(v,:)=mean(bast); 
    end
 end
 br=abs(diff(bas));
 [nbr,lbr]=find(br>brlim);
 nbr=unique(nbr);
 if ~isempty(nbr)
  [qrsan,rr]=remov(qrsan,nbr,heasig,t,rr);
  notstime(nbr)=[]; 
 end
 no_beats=length(qrsan.time);
end

st=zeros(length(qrsan.time),no_leads);
qd=zeros(length(qrsan.time),no_leads);
qt=zeros(length(qrsan.time),no_leads);
tp=zeros(length(qrsan.time),no_leads);
ta=zeros(length(qrsan.time),no_leads);
%%ESTA ES LA PARTE QUE AVERIGUA EL INICIO Y EL FINAL DE UN LATIDO
 
% ----  Determination of beat limits as function of RR interval  ----
%    bt: back time (in samples) from QRS fiducial point (beginning of window beat)
%    ft: forward time (in samples) from QRS fiducial point (end of window beat)
%    L:  maximum beat length
%    fidp: relative position of fiducial point
L=ceil((600+85+240)*heasig.freq/1000);
ft=zeros(size(rr));
bt=zeros(length(rr)+1,1);
aux=find(rr<(720*heasig.freq/1000));
auxc=find(rr>=(720*heasig.freq/1000));
ft(aux)=ceil(2/3*rr(aux)); %%las que son menores que 720ms entre latidos, les pone que el final del latido es 2/3 del tiempo total
ft(auxc)=ceil(min(684*heasig.freq/1000,rr(auxc)-240*heasig.freq/1000)); %y con las mayores, el minimo entre 684ms y la duracion -240ms
if (no_beats>1) 
 ft=[ft;ft(length(ft))]; % ---- extend for the last beat ----
 rr1=[rr(1);rr]; % ---- RR interval with respect to previous beat ----
 aux1=find(rr1<(720*heasig.freq/1000));
 auxc1=find(rr1>=(720*heasig.freq/1000));
 bt(aux1)=ceil(1/3*rr1(aux1));  %%pone el inicio del latido a 1/3 de la duracion total del latido
 bt(auxc1)=ceil(240*heasig.freq/1000); %% si dura mas de 720ms, pone el inicio en 240ms
 fidp=ceil(240*heasig.freq/1000)+1;
end

if ((baz_flag==1)&(no_beats>1)) %%No estamos aplicando Bazetts correction
       rre=[rr;rr(length(rr))];
       n_freq=round(heasig.freq./sqrt(rre./heasig.freq));  
end

% ----  Loop for segment analysis  ----
ti=t(1);
ilat=1;nlat=min(nlat,length(qrsan.time));
w0=[]; e0=[]; 
no_leadsb=no_leads;

qan=selantl(annot,'N','0'); %%AQUI HABIA UNA VARIABLE ANNOT QUE NO EXISTE  
%%SUPONGO QUE ESTA VARIABLE ANNOT ES EL .MAT CREADO DE TODOS LOS PU

while ilat<no_beats-1,  
   
   % ----  excerpt reading  ----
   %ilat
   flat=ilat+nlat+1;
   if nlat>=length(qrsan.time)
      tf=qrsan.time(nlat)+0.1*heasig.freq;
      nlat=nlat-2;
   else tf=qrsan.time(flat)+0.1*heasig.freq; end
   if typerec==0 ecg=getvec(fid,heasig,ti,tf)./heasig.gain*1000; end  %%%aqui coge los datos del ecg por bloques de latidos (21)
   if typerec==1 ecg=(getecg(dirsig,ecgnr,[ti,tf],[1:no_leadsb]))'; end
  ecg=ecg';
   %%AQUI LO EJECUTA DESPUES DE CALCULAR LOS PUNTOS
   % ---- baseline wander removing  ---- 
   if bas_flag==1
     if basltype==1, ecg=baseline2(ecg,notstime(ilat:flat),ti);  % ---- cubic splines ----
     elseif basltype==2, ecg=baseline1(ecg,heasig.freq,.3);   % ---- IIR filtering ----
     ecg=round(ecg);
     end
   end
   
   % ---- 9 to 12 leads expansion or 9 to Frank leads ----
   %if typerec==1
   %  if leadsele==1, ecg=(leadcalc(ecg','extr'))';    
   %  elseif leadsele==2, ecg=(leadcalc(ecg','synt'))';
   %  end
   %  no_leads=size(ecg,2);
   %end
   
   for l=1:no_leadsb
     for k=ilat+1:flat-1
         
       [difq,kr]=min(abs(qrsan.time(k)-qan(1).time));  %%aqui practicamente averigua cual es el mismo latido para qrsan y qan
       if (difq<50*heasig.freq/1000) %%comprueba que la dif sea menor de 50ms en el caso en el que no sean los mismos (que no se cuando seria esto la vd)
         % ----  STn level measurement  ----
 	 timef=qan(1).time(kr); timet=timef+160*heasig.freq/1000; %%el tiempo final para el calculo de stn level lo considera 160ms despues del inicio
     an1=selan(annot,')','1',l,[timef timet]);  %%AQUI HABIA UNA VARIABLE ANNOT QUE NO EXISTE
     %%aqui an1 pasa a estar vacio porque selan lo elimina
     
     %falla al detectar el inicio y el final de los qrs
     %es probable que la anotacion pu sea el programa de pablo del que me
     %hablo Josechu, tengo que buscarlo y usarlo.
     
     %qan no tiene los qrs, si no los inicios y los finales. 
     
         if ~isempty(an1(l).time), qrsoff(l)=an1(l).time(1); dref1(l)=qrsoff(l)-qan(1).time(kr);
         else qrsoff(l)=qan(1).time(kr)+dref1(l)*heasig.freq/1000; end    %y como an1 esta vacio, se usa dref(1) y creo q eso es lo que esta dando un mal resultado
         jpn(k,l)=qrsoff(l)+60*heasig.freq/1000-ti;   %qrsoff esta mal por eso

         timef=qan(1).time(kr)-160*heasig.freq/1000; timet=qan(1).time(kr);
	 an1=selan(annot,'(','1',l,[timef timet]); %%AQUI HABIA UNA VARIABLE ANNOT QUE NO EXISTE
	 if ~isempty(an1(l).time)
         qrson(l)=an1(l).time(1); 
         dref2(l)=qan(1).time(kr)-qrson(l);
         else qrson(l)=qan(1).time(kr)-dref2(l)*heasig.freq/1000; end  %% qrson vuelve a estar mal por an1 estar vacio de nuevo

	 basv(l)=mean(ecg(qrson(l)-15*heasig.freq/1000-ti:qrson(l)-5*heasig.freq/1000-ti,l));   %%%aqui esta la parte importante
         st(k,l)=ecg(jpn(k,l),l)-basv(l);   %y st esta mal porque jpn sale de qrsoff


         % ----  QRS duration measurement  ----
         qd(k,l)=qrsoff(l)-qrson(l);        %qd esta mal porque qrson y qrsoff estan mal

         % ----  T position measurement  ---- 
         timef=qrsoff(l); timet=qan(1).time(kr)+500*heasig.freq/1000;
	 an1=selan(annot,'t','',l,[timef timet]); %%AQUI HABIA UNA VARIABLE ANNOT QUE NO EXISTE   %timef esta mal y an1 se borra por eso o por lo de siempre
	 if ~isempty(an1(l).time), tppos(l)=an1(l).time(1); dref3(l)=tppos(l)-qan(1).time(kr);
         else tppos(l)=qan(1).time(kr)+dref3(l)*heasig.freq/1000; end    %tppos esta mal porque an1 esta vacio
         tp(k,l)=tppos(l)-qan(1).time(kr);                         %y tp esta mal porque tppos esta mal

         % ----  T amplitude measurement  ----
         ta(k,l)=ecg(tppos(l)-ti,l)-basv(l);                    %y ta tambien esta mal porque tppos esta mal

         % ----  QT measurement  ---- 
	 an1=selan(annot,')','2',l,[timef timet]); %%AQUI HABIA UNA VARIABLE ANNOT QUE NO EXISTE
	 if ~isempty(an1(l).time), tpend(l)=an1(l).time(1); dref4(l)=tpend(l)-qan(1).time(kr);
         else tpend(l)=qan(1).time(kr)+dref4(l)*heasig.freq/1000; end
         qt(k,l)=tpend(l)-qrson(l);
 
       else st(k,l)=st(k-1,l); qd(k,l)=qd(k-1,l); tp(k,l)=tp(k-1,l); ta(k,l)=ta(k-1,l); qt(k,l)=qt(k-1,l);  
       end  
     end
   end
 
   ilat=ilat+nlat;
   nlat=min(nlat,no_beats-ilat-1); % # beats for next loop   
   ti=qrsan.time(ilat)-0.2*heasig.freq;
 
end
st(1,:)=[]; st(size(st,1),:)=[];
qt(1,:)=[]; qt(size(qt,1),:)=[];
qd(1,:)=[]; qd(size(qd,1),:)=[];
tp(1,:)=[]; tp(size(tp,1),:)=[];
ta(1,:)=[]; ta(size(ta,1),:)=[];

timebeats=qrsan.time(2:length(qrsan.time)-1);

flag=0;
if(size(st,2)>9)
    staux = st(:,10);
    qtaux = qt(:,10);
    qdaux = qd(:,10);
    tpaux = tp(:,10);
    taaux = ta(:,10);
    
    st(:,10) = [];
    qt(:,10) = [];
    qd(:,10) = [];
    tp(:,10) = [];
    ta(:,10) = [];
    
    flag = 1;
end

st=leadcalc(st,'extr');
qt=leadcalct(qt,'extr');
qd=leadcalct(qd,'extr');
tp=leadcalct(tp,'extr');
ta=leadcalc(ta,'extr');

if(flag==1)
    st = [st; staux'];
    qt = [qt; qtaux'];
    qd = [qd; qdaux'];
    tp = [tp; tpaux'];
    ta = [ta; taaux'];

end
% ----  Results saving  ----
%if (toption)
%   eval(['save ' rname  ' kl timebeats']);
%else eval(['save ' rname  ' kl']);
%end


% ----  Files closing  ----
fclose('all');
 
