%%Creates the figure corresponding to the p values of all the local
%%measurements in every lead with respect to the known group classification

load('data_matrix_ICS.mat')
load('groups_num.mat');

res = zeros(5,9);
for j = 1:9
    for i = 1:5
        res(i,j) = anova1(data_matrix_ICS.vars(:,(j-1)*5+i),groups);
        close all
    end
end

save('Anova_Table','res');