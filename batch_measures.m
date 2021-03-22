fclose('all');
clear;clc;close;

load 'ListaEcgsJosechu.mat';
%dirhea='C:\Users\Jorge\Desktop\BSICOS\Resultados\Analysis_60Hz_filt_dat_files\ecg_filt(dat+hea)\';
dirsig = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\StaffIII\data\';
dirhea = dirsig;
dirann='C:\Users\Jorge\Desktop\BSICOS\Datos_Josechu\annot_staff3\';
anot1='pu';
anot2='ari';
matdir='';
typerec=0;
leadsele=1;
t=[];
bas_flag=1;
basltype=1;
baz_flag=0;
nor_flag=1;
rej_flag = 1;
brlim=200;
nbo_flag=1;
pwl_flag=1;

lista = listOfEcgNumbers;
for k=1:size(lista,2)
    eval(['ecgnr=' 'deblank(lista{k});']);
    [timebeats,st,qt,qd,ta,tp]=measures(dirhea,dirsig,dirann,anot1,anot2,ecgnr,typerec,leadsele,t,bas_flag,basltype,baz_flag,rej_flag,brlim,nbo_flag,pwl_flag);
    rname=['ms_'  ecgnr];
    eval(['save ' rname  ' timebeats st qt qd ta tp']);
end


 
