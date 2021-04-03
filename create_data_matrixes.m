clear;clc;
load('ics_deltaindex_results.mat');
lista=char('002','003','006','007','008','009','010','011','013','014','015','016','017','018','019','020','021','022','023','025','026','029','030','031','032','037','039','040','041','046','047','048','049','050','051','052','053','054','055','056','057','058','059','061','062','063','065','066','068','069','070','071','072','073','074','075','077','079','080','081','082','083','084','085','086','087','088','090','091','092','094','095','096','097','098','099','100','101','102','104','105','106','107');

arteries = loadvars();

data_matrix_delta.vars = zeros(83,45,43);
data_matrix_ICS.vars = zeros(83,45,43);
data_matrix_delta.vars(:,1:45,:) = [delta_st(:,1:9,:) delta_qt(:,1:9,:) delta_qd(:,1:9,:) delta_ta(:,1:9,:) delta_tp(:,1:9,:)];
data_matrix_ICS.vars(:,1:45,:) = [f_st(:,1:9,:) f_qt(:,1:9,:) f_qd(:,1:9,:) f_ta(:,1:9,:) f_tp(:,1:9,:)];
for i=1:83
    data_matrix_delta.patient{i} = lista(i,:);
    data_matrix_ICS.patient{i} = lista(i,:);
    for j=1:length(arteries.fields)
        for k = 1:length(arteries.(arteries.fields(j)))
            if lista(i,:) == arteries.(arteries.fields(j))(k,1:end-1)
                data_matrix_delta.artery{i} = arteries.fields(j);
                data_matrix_ICS.artery{i} = arteries.fields(j);
            end
        end
    end
end

save('data_matrix_delta','data_matrix_delta');
save('data_matrix_ICS','data_matrix_ICS');

