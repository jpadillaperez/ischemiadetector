%%Calculate delta_index and ICS_index from local measurements (st, ta, tp,
%%..) obtained in measures.m

%recorded ecgs with standard beats
lista1=char('002c','003b','006b','007b','008b','009b','010b','011b','013b','014b','015b','016b','017b','018a','019b','020b','021b','022c','023b','025b','026b','029b','030b','031b','032b','037b','039b','040b','041b','046b','047b','048b','049a','050b','051b','052b','053b','054b','055a','056a','057b','058a','059a','061a','062a','063a','065b','066b','068b','069b','070a','071b','072b','073b','074b','075a','077b','079b','080b','081b','082b','083b','084a','085a','086a','087a','088a','090b','091b','092b','094b','095b','096b','097b','098b','099b','100a','101a','102b','104b','105a','106b','107b');
%recorded ecgs with inflations
lista2=char('002d','003c','006c','007c','008c','009c','010c','011c','013c','014c','015c','016c','017c','018b','019c','020c','021c','022d','023c','025c','026c','029c','030c','031c','032c','037c','039c','040c','041c','046c','047c','048c','049b','050c','051c','052c','053c','054c','055b','056b','057c','058b','059b','061b','062b','063b','065c','066c','068c','069c','070b','071c','072c','073c','074c','075b','077c','079c','080c','081c','082c','083c','084b','085b','086b','087c','088b','090c','091c','092c','094c','095c','096c','097c','098c','099c','100b','101b','102c','104c','105b','106c','107c');

%inflation time
timeptca=[125;306;182;300;230;197;295;302;170;275;305;303;294;200;190;290;310;181;183;300;420;181;298;90;126;318;285;298;303;180;291;302;282;299;278;301;294;116;141;298;302;317;180;303;301;273;296;289;300;184;437;319;180;169;296;296;123;214;275;302;300;297;300;306;298;300;119;315;299;239;300;296;299;298;338;300;289;300;302;300;301;310;300];  % inflation time
%PTCA beginning
ptca_be=[0;34;0;15;0;131;30;103;0;110;128;205;151;0;0;80;0;0;7;39;0;96;0;0;68;0;0;72;22;0;0;0;0;168;30;4;100;133;16;89;7;0;7;4;86;0;0;109;119;0;0;125;0;36;20;16;0;96;0;32;55;73;55;68;60;112;20;32;193;108;162;106;94;8;20;142;21;18;80;117;68;104;86];  % beginning of PTCA
%selected complexes
compl=char('stt','t','st','qrs');  

resname='res';
step= 10;

for k=1:size(lista1,1)
 ecgnr1=lista1(k,:);  
 ecgnr2=lista2(k,:);  
 
 ptca_b=ptca_be(k)*1000;  % begining of PTCA in samples
 ptca_e=ptca_b+(timeptca(k)-1)*1000;  % end of PTCA in samples
 
 load ([pwd '\Internal_measures\ms_' ecgnr1]);
 st=(aver(st',8,'nor'))'; 
 qt=(aver(qt',8,'nor'))';
 qd=(aver(qd',8,'nor'))';
 tp=(aver(tp',8,'nor'))';
 ta=(aver(ta',8,'nor'))';

 stdc_st=(std(st,0,2))';   
 stdc_qt=(std(qt,0,2))';   
 stdc_qd=(std(qd,0,2))';   
 stdc_tp=(std(tp,0,2))';   
 stdc_ta=(std(ta,0,2))';   

 load ([pwd '\Internal_measures\ms_' ecgnr2]);
 st=(aver(st',8,'nor'))';
 qt=(aver(qt',8,'nor'))';
 qd=(aver(qd',8,'nor'))';
 tp=(aver(tp',8,'nor'))';
 ta=(aver(ta',8,'nor'))';

 tb=find(timebeats>ptca_b);
 b=tb(1); %start the study of ptca from this beat 
 clear tb;
 
  ttt=0;
  
  for et=ptca_b+step*1000:step*1000:ptca_e      %12 beats processed in every loop
    te=find(timebeats<et);
    e=te(length(te)); clear te;
    ttt=ttt+1;

    for l=1:12
       pol=polyfit(timebeats(b:e,1),st(l,b:e)',1);      %linear regression of every index in the beats from beginning to the number of beats (more beats every time)
       alpha(l)=pol(1);                                 %the coefficient for the slope of the linear regression
    end
    delt_st=alpha.*(et-ptca_b);                 %the delta index is calculated with the position of the difference in time between the start of PTCA and the current time of occlusion of the beat
    for l=1:12
       pol=polyfit(timebeats(b:e,1),qt(l,b:e)',1);
       alpha(l)=pol(1);
    end
    delt_qt=alpha.*(et-ptca_b);
    for l=1:12
       pol=polyfit(timebeats(b:e,1),qd(l,b:e)',1);
       alpha(l)=pol(1);
    end
    delt_qd=alpha.*(et-ptca_b);
    for l=1:12
       pol=polyfit(timebeats(b:e,1),tp(l,b:e)',1);
       alpha(l)=pol(1);
    end
    delt_tp=alpha.*(et-ptca_b);
    for l=1:12
       pol=polyfit(timebeats(b:e,1),ta(l,b:e)',1);
       alpha(l)=pol(1);
    end
    delt_ta=alpha.*(et-ptca_b);

    fa_st=delt_st./stdc_st;         %ICS = delta_index/std_index
    fa_qt=delt_qt./stdc_qt;
    fa_qd=delt_qd./stdc_qd;
    fa_tp=delt_tp./stdc_tp;
    fa_ta=delt_ta./stdc_ta;

    %Generalize for all the beats and patients
    delta_st(k,:,ttt)=delt_st;
    delta_qt(k,:,ttt)=delt_qt;
    delta_qd(k,:,ttt)=delt_qd;
    delta_tp(k,:,ttt)=delt_tp;
    delta_ta(k,:,ttt)=delt_ta;
    f_st(k,:,ttt)=fa_st;
    f_qt(k,:,ttt)=fa_qt;
    f_qd(k,:,ttt)=fa_qd;
    f_tp(k,:,ttt)=fa_tp;
    f_ta(k,:,ttt)=fa_ta;
  end
    delt_st = squeeze(delta_st(k,:,1:ttt));
    delt_qt = squeeze(delta_qt(k,:,1:ttt));
    delt_qd = squeeze(delta_qd(k,:,1:ttt));
    delt_tp = squeeze(delta_tp(k,:,1:ttt));
    delt_ta = squeeze(delta_ta(k,:,1:ttt));
    fa_st = squeeze(f_st(k,:,1:ttt));
    fa_qt = squeeze(f_qt(k,:,1:ttt));
    fa_qd = squeeze(f_qd(k,:,1:ttt));
    fa_tp = squeeze(f_tp(k,:,1:ttt));
    fa_ta = squeeze(f_ta(k,:,1:ttt));
    
  save(['ics' lista1(k,1:end-1)],'fa_st', 'fa_qt', 'fa_qd', 'fa_tp', 'fa_ta');
  save(['delta_indexes' lista1(k,1:end-1)],'delt_st', 'delt_qt', 'delt_qd', 'delt_tp', 'delt_ta')
end
 
% ----  Results saving  ----
%save('res', 'delta_st', 'delta_qt', 'delta_qd', 'delta_tp', 'delta_ta', 'f_st', 'f_qt', 'f_qd', 'f_tp', 'f_ta');
 
