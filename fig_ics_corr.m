clear;clc;

addpath('C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\others\ver1\MATS')
lista1=char('002c','003b','006b','007b','008b','009b','010b','011b','013b','014b','015b','016b','017b','018a','019b','020b','021b','022c','023b','025b','026b','029b','030b','031b','032b','037b','039b','040b','041b','046b','047b','048b','049a','050b','051b','052b','053b','054b','055a','056a','057b','058a','059a','061a','062a','063a','065b','066b','068b','069b','070a','071b','072b','073b','074b','075a','077b','079b','080b','081b','082b','083b','084a','085a','086a','087a','088a','090b','091b','092b','094b','095b','096b','097b','098b','099b','100a','101a','102b','104b','105a','106b','107b');
m3res = zeros(12,12,83);
for k = 1:83
mres = zeros(12,12);
for i=1:12
    for j=1:12
        load(['Delta_indexes_and_ICS/ics' lista1(k,1:end-1)]);
        res = corrcoef(fa_tp(i,:),fa_tp(j,:));
        mres(i,j) = res(1,2);
    end
end
m3res(:,:,k) = mres;
end

pcolor(mean(m3res,3))
colorbar;
title('Pearson Correlation between leads for tp measurement')
xlabel('leads')
ylabel('leads')