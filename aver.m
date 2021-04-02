function xav=expav(x,num,type)
%%MOVING AVERAGE OF X IN A WINDOW OF NUM SIZE USING TYPE NOR.

if type=='nor'
  xav=zeros(size(x));
  xav(1,:)=x(1,:);         
  for m=2:num
    xav(m,:)=sum(x(1:m,:))/m;      %Hace una media acumulativa de los primeros num digitos
  end
  for m=num+1:size(x,1)
    xav(m,:)=mean(x(m-num+1:m,:));      %Hace la moving average de una ventana de num valores
  end  
end

if type=='exp'
 for l=1:size(x,2)
   xav(1,l)=x(1,l);
   for m=2:size(x,1)
     xav(m,l)=xav(m-1,l)+num*(x(m,l)-xav(m-1,l));  %hace una suma de (t-1)+num*(t-(t-1)) ponderada por num (a mi parecer es como una forma de suavizar la función)
   end 
 end
end

