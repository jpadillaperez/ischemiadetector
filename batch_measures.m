function batch_measures(dirsig, dirhea, dirann, output, standard_flag, pwl_flag)
%Creates the local measures (st level, t wave amplitude, ...) for all the
%recordings in a database

% dirhea='C:\Users\Jorge\Desktop\BSICOS\Resultados\Analysis_60Hz_filt_dat_files\ecg_filt(dat+hea)\';
% dirsig = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\StaffIII\data\';
% dirhea = dirsig;
% dirann = 'C:\Users\Jorge\Desktop\BSICOS\Datos_Josechu\annot_staff3\';

load 'var_dependencies\ListaEcgsJosechu.mat';
lista = listOfEcgNumbers;

anot1='pu';
anot2='ari';
brlim = 200;
typerec = 0;
leadsele = 1;
bas_flag = 1;
basltype = 1;
baz_flag = 0;
rej_flag = 1;
nbo_flag = 1;
t = [];

mkdir (output);
for k=1:size(lista,2)
    eval(['ecgnr=' 'deblank(lista{k});']);
    [timebeats,st,qt,qd,ta,tp] = measures(dirhea,dirsig,dirann,anot1,anot2,ecgnr,typerec,leadsele,t,bas_flag,basltype,baz_flag,rej_flag,brlim,nbo_flag,pwl_flag,standard_flag);
    rname=[output 'ms_'  ecgnr];
    eval(['save ' rname  ' timebeats st qt qd ta tp']);
end
end

