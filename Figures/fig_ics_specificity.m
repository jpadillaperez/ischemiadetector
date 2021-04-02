lista1=char('002c','003b','006b','007b','008b','009b','010b','011b','013b','014b','015b','016b','017b','018a','019b','020b','021b','022c','023b','025b','026b','029b','030b','031b','032b','037b','039b','040b','041b','046b','047b','048b','049a','050b','051b','052b','053b','054b','055a','056a','057b','058a','059a','061a','062a','063a','065b','066b','068b','069b','070a','071b','072b','073b','074b','075a','077b','079b','080b','081b','082b','083b','084a','085a','086a','087a','088a','090b','091b','092b','094b','095b','096b','097b','098b','099b','100a','101a','102b','104b','105a','106b','107b');
for k = 1:83
    load(['Delta_indexes_and_ICS/ics' lista1(k,1:end-1)]);
    for j = 1:12
        coll_st(j,k) = abs(fa_st(j,end));
        coll_qt(j,k) = abs(fa_qt(j,end));
        coll_qd(j,k) = abs(fa_qd(j,end));
        coll_ta(j,k) = abs(fa_ta(j,end));
        coll_tp(j,k) = abs(fa_tp(j,end));
    end
end

avcoll_st = mean(coll_st,2);
plot(avcoll_st,'*-');
hold on;
avcoll_qt = mean(coll_qt,2);
plot(avcoll_qt,'d-');
avcoll_qd = mean(coll_qd,2);
plot(avcoll_qd,'o-');
avcoll_ta = mean(coll_ta,2);
plot(avcoll_ta,'+-');
avcoll_tp = mean(coll_tp,2);
plot(avcoll_tp,'p-');
axis([0 13 0 60])
legend('ST','QT','QRS_d','T_a','T_p');
title('ICS for local indexes')