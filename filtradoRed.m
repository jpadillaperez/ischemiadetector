function y=filtradoRed(x,fm,fred,alfa)
% y=filtradoRed(x,fm,alfa);
% Realiza un filtrado no lineal para eliminar interferencias de la red electrica 50Hz
% x    = Señal de entrada
% fm   = Frecuencia de muestreo de la señal
% fred = Frecuencia de la red electrica
% alfa = Parametro de convergencia del algoritmo. Por defecto alfa=2.
% y    = Señal de salida
% (c) Eduardo Gil, 5-May-2008.
% 

%start=clock;
if nargin<3
    fred=50;
    alfa=2;
elseif nargin<4
    alfa=2;
end 


v=zeros(1,length(x));
v2=zeros(1,length(x));

v(1)=1;
v(2)=2*cos(2*pi*fred/fm);
for i=3:length(x)
    v(i)=2*cos(2*pi*fred/fm)*v(i-1)-v(i-2);
    e2=x(i)-x(i-1)-(v(i)-v(i-1));
    v2(i)=v(i)+alfa*sign(e2);
    v(i)=v2(i);
end

y=x-v2;
