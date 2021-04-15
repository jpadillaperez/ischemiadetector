function create_data_matrixes_v1v2(icsdir, normalicsdir, output)
%This function edits the original measurements to create a bigger matrix of
%data containing just the values of the indexes at the end of the occlusion
%and just the 9 original leads of the database. It also creates the
%necessary groups variables and the matrix of data ready to export to spss

lista=char('002','003','006','007','008','009','010','011','013','014','015','016','017','018','019','020','021','022','023','025','026','029','030','031','032','037','039','040','041','046','047','048','049','050','051','052','053','054','055','056','057','058','059','061','062','063','065','066','068','069','070','071','072','073','074','075','077','079','080','081','082','083','084','085','086','087','088','090','091','092','094','095','096','097','098','099','100','101','102','104','105','106','107');
arteries = loadarteriesclassif();

data_matrix_delta.vars = zeros(83,45);
data_matrix_ICS.vars = zeros(83,45);
mkdir(output)

for h = 1:83
    
    load([normalicsdir 'ics' lista(h,:)])
    load([normalicsdir 'delta_indexes' lista(h,:)])
    
    for g = 1:10
        if (g<7)
            data_matrix_delta.vars(h,(g-1)*5+1) = delt_st(g,end);
            data_matrix_delta.vars(h,(g-1)*5+2) = delt_qt(g,end);
            data_matrix_delta.vars(h,(g-1)*5+3) = delt_qd(g,end);
            data_matrix_delta.vars(h,(g-1)*5+4) = delt_ta(g,end);
            data_matrix_delta.vars(h,(g-1)*5+5) = delt_tp(g,end);
            
            data_matrix_ICS.vars(h,(g-1)*5+1) = fa_st(g,end);
            data_matrix_ICS.vars(h,(g-1)*5+2) = fa_qt(g,end);
            data_matrix_ICS.vars(h,(g-1)*5+3) = fa_qd(g,end);
            data_matrix_ICS.vars(h,(g-1)*5+4) = fa_ta(g,end);
            data_matrix_ICS.vars(h,(g-1)*5+5) = fa_tp(g,end);
        elseif (g == 7)
            data_matrix_delta.vars(h,(g-1)*5+1) = delt_st(8,end);
            data_matrix_delta.vars(h,(g-1)*5+2) = delt_qt(8,end);
            data_matrix_delta.vars(h,(g-1)*5+3) = delt_qd(8,end);
            data_matrix_delta.vars(h,(g-1)*5+4) = delt_ta(8,end);
            data_matrix_delta.vars(h,(g-1)*5+5) = delt_tp(8,end);
            
            data_matrix_ICS.vars(h,(g-1)*5+1) = fa_st(8,end);
            data_matrix_ICS.vars(h,(g-1)*5+2) = fa_qt(8,end);
            data_matrix_ICS.vars(h,(g-1)*5+3) = fa_qd(8,end);
            data_matrix_ICS.vars(h,(g-1)*5+4) = fa_ta(8,end);
            data_matrix_ICS.vars(h,(g-1)*5+5) = fa_tp(8,end);
        elseif (g == 8)
            data_matrix_delta.vars(h,(g-1)*5+1) = delt_st(10,end);
            data_matrix_delta.vars(h,(g-1)*5+2) = delt_qt(10,end);
            data_matrix_delta.vars(h,(g-1)*5+3) = delt_qd(10,end);
            data_matrix_delta.vars(h,(g-1)*5+4) = delt_ta(10,end);
            data_matrix_delta.vars(h,(g-1)*5+5) = delt_tp(10,end);
            
            data_matrix_ICS.vars(h,(g-1)*5+1) = fa_st(10,end);
            data_matrix_ICS.vars(h,(g-1)*5+2) = fa_qt(10,end);
            data_matrix_ICS.vars(h,(g-1)*5+3) = fa_qd(10,end);
            data_matrix_ICS.vars(h,(g-1)*5+4) = fa_ta(10,end);
            data_matrix_ICS.vars(h,(g-1)*5+5) = fa_tp(10,end);
        elseif (g == 9)
            data_matrix_delta.vars(h,(g-1)*5+1) = delt_st(12,end);
            data_matrix_delta.vars(h,(g-1)*5+2) = delt_qt(12,end);
            data_matrix_delta.vars(h,(g-1)*5+3) = delt_qd(12,end);
            data_matrix_delta.vars(h,(g-1)*5+4) = delt_ta(12,end);
            data_matrix_delta.vars(h,(g-1)*5+5) = delt_tp(12,end);
            
            data_matrix_ICS.vars(h,(g-1)*5+1) = fa_st(12,end);
            data_matrix_ICS.vars(h,(g-1)*5+2) = fa_qt(12,end);
            data_matrix_ICS.vars(h,(g-1)*5+3) = fa_qd(12,end);
            data_matrix_ICS.vars(h,(g-1)*5+4) = fa_ta(12,end);
            data_matrix_ICS.vars(h,(g-1)*5+5) = fa_tp(12,end);
        elseif (g == 10)
            load([icsdir 'ics' lista(h,:)])
            load([icsdir 'delta_indexes' lista(h,:)])
            
            data_matrix_delta.vars(h,(g-1)*5+1) = delt_st(12,end);
            data_matrix_delta.vars(h,(g-1)*5+2) = delt_qt(1,end);
            data_matrix_delta.vars(h,(g-1)*5+3) = delt_qd(1,end);
            data_matrix_delta.vars(h,(g-1)*5+4) = delt_ta(1,end);
            data_matrix_delta.vars(h,(g-1)*5+5) = delt_tp(1,end);
            
            data_matrix_ICS.vars(h,(g-1)*5+1) = fa_st(1,end);
            data_matrix_ICS.vars(h,(g-1)*5+2) = fa_qt(1,end);
            data_matrix_ICS.vars(h,(g-1)*5+3) = fa_qd(1,end);
            data_matrix_ICS.vars(h,(g-1)*5+4) = fa_ta(1,end);
            data_matrix_ICS.vars(h,(g-1)*5+5) = fa_tp(1,end);
        end
    end
end

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

%%Preparing groups variable as string and numbers
groups = [];
for j = 1:83
    ar = data_matrix_ICS.artery{j};
    groups = [groups; ar];
end
save ('var_dependencies\groups_str', 'groups')

a = (groups=="lad")*1;
b = (groups=="rca")*2;
c = (groups=="cir")*3;
groups = a+b+c;

save('var_dependencies\groups_num', 'groups')

%%Creating data for using spss program of statistics
load('var_dependencies\leaflet10')
prepared_data_spss_ics = [leafletvar "groups"; data_matrix_ICS.vars groups];
prepared_data_spss_delta = [leafletvar "groups"; data_matrix_delta.vars groups];

xlswrite([output 'data_spss_ics.xlsx'], prepared_data_spss_ics);
xlswrite([output 'data_spss_delta.xlsx'],prepared_data_spss_delta);

%%Saving the local variables in mat format
save([output 'data_matrix_delta'],'data_matrix_delta');
save([output 'data_matrix_ICS'],'data_matrix_ICS');

fclose('all');
end