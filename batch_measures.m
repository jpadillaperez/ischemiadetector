fclose('all');

eval('load C:\Users\Jorge\Desktop\BSICOS\Datos_Josechu\annot_staff3\Others\ListaEcgsJosechu.mat');
%dirhea='/home/josechu/annot/staff3/';
dirhea='C:\Users\Jorge\Desktop\BSICOS\Resultados\Analysis_60Hz_filt_dat_files\ecg_filt(dat+hea)\';
dirsig='C:\Users\Jorge\Desktop\BSICOS\Resultados\Analysis_60Hz_filt_dat_files\ecg_filt(dat+hea)\';
%dirann='/home/josechu/annot/staff3/';
dirann='C:\Users\Jorge\Desktop\BSICOS\Resultados\Workspaces\Workspace_Annotations_Replicated\';
anot1='pu';
anot2='ari';%matdir='/home/josechu/';
matdir='C:\Users\Jorge\Desktop/';
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

%lista=char('070b','71c','72c','73c','74c','75b','77c','79c','80c','81c','82c','69c');
%lista=char('063a'); %%Recuerda que aqui tienes una variable preparada de todos los nombres de ecgs de Josechu en Datos_Josechu\annot_staff3\Others
 
 %lista = listOfEcgNumbers;
 %for k=60:size(lista,2)
    %eval(['ecgnr=' 'deblank(lista{k});']);
    %ecgnr = [ecgnr '_X'];
    ecgnr = '063a';
    [timebeats,st,qt,qd,ta,tp]=measures(dirhea,dirsig,dirann,anot1,anot2,ecgnr,typerec,leadsele,t,bas_flag,basltype,baz_flag,rej_flag,brlim,nbo_flag);
    rname=['ms_'  ecgnr];
    eval(['save ' rname  ' timebeats st qt qd ta tp']);
%end


% for k=1:size(lista,1)
% %for k=15:15
%   lista(k,:);
%   eval(['ecgnr=' 'deblank(lista(k,:));'])
%     
%   % ----- local indexes estimation -----------------------------------------
%   [timebeats,st,qt,qd,ta,tp]=measures(dirhea,dirsig,dirann,anot1,anot2,ecgnr,typerec,leadsele,t,bas_flag,basltype,baz_flag,rej_flag,brlim,nbo_flag);
% 
%   % ------------------------------------------------------------------------
%   rname=['ms_'  ecgnr];
%   eval(['save ' rname  ' timebeats st qt qd ta tp']);
% end



 
