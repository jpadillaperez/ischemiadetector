%%Discriminant Multivariate Analysis of different number of variables

%Este código está pensado para ser ejecutado por secciones dependiendo del
%número de variables que se deseen.

clear;clc;
load('data_matrix_ICS')
load('leaflet')
load('groups_str')

%%
%%ANALYSIS FOR THREE VARIABLES
v = data_matrix_ICS.vars(1,:);
C = nchoosek(v,3);
stats = cell(length(C),1);
D = cell(length(C),1);
P = cell(length(C),1);
rec = zeros(length(C),2);
pos = zeros(3,length(C));

for i = 1:length(C)
    pos(1,i) = find(C(i,1)==data_matrix_ICS.vars(1,:));
    pos(2,i) = find(C(i,2)==data_matrix_ICS.vars(1,:));
    pos(3,i) = find(C(i,3)==data_matrix_ICS.vars(1,:));
    [D{i}, P{i}, stats{i}] = manova2([data_matrix_ICS.vars(:,pos(1,i)) data_matrix_ICS.vars(:,pos(2,i)) data_matrix_ICS.vars(:,pos(3,i))],groups);
    if isstruct(stats{i})==0
        rec(i,:) = 1;
        fprintf("found singular matrix on %d iteration",i)
    else
        rec(i,:) = stats{i}.lambda;
    end
    if (i==round(length(C)/4))
        disp("25% reached")
    elseif (i==round(length(C)/2))
        disp("50% reached")
    elseif (i==round(length(C)*0.75))
        disp("75% reached")
    elseif (i==round(length(C)))
        disp("100% reached")
    end
end

[~,resPos] = min(rec);

fprintf('Variables used in the model are: %s lead, %s lead, %s lead\n',leafletvar(pos(1,resPos(1))),leafletvar(pos(2,resPos(1))),leafletvar(pos(3,resPos(1))))
fprintf('and the corresponding coefficients of the function are: %f, %f, %f\n', stats{resPos(1)}.eigenvec(1,1), stats{resPos(1)}.eigenvec(2,1), stats{resPos(1)}.eigenvec(3,1))

%classif_bayes(stats, groups, resPos(1))


%%
%%ANALYSIS FOR FOUR VARIABLES
v = data_matrix_ICS.vars(1,:);
C = nchoosek(v,4);
stats = cell(length(C),1);
D = cell(length(C),1);
P = cell(length(C),1);
rec = zeros(length(C),2);
pos = zeros(4,length(C));

for i = 1:length(C)
    pos(1,i) = find(C(i,1)==data_matrix_ICS.vars(1,:));
    pos(2,i) = find(C(i,2)==data_matrix_ICS.vars(1,:));
    pos(3,i) = find(C(i,3)==data_matrix_ICS.vars(1,:));
    pos(4,i) = find(C(i,4)==data_matrix_ICS.vars(1,:));
    
    [D{i}, P{i}, stats{i}] = manova2([data_matrix_ICS.vars(:,pos(1,i)) data_matrix_ICS.vars(:,pos(2,i)) data_matrix_ICS.vars(:,pos(3,i)) data_matrix_ICS.vars(:,pos(4,i))],groups);
    if isstruct(stats{i})==0
        rec(i,:) = 1;
        fprintf("found singular matrix on %d iteration",i)
    else
        rec(i,:) = stats{i}.lambda;
    end
    
    if (i==round(length(C)*0.1))
        disp("10% reached")
    elseif (i==round(length(C)*0.2))
        disp("20% reached")
    elseif (i==round(length(C)*0.3))
        disp("30% reached")
    elseif (i==round(length(C)*0.4))
        disp("40% reached")
    elseif (i==round(length(C)*0.5))
        disp("50% reached")
    elseif (i==round(length(C)*0.6))
        disp("60% reached")
    elseif (i==round(length(C)*0.7))
        disp("70% reached")
    elseif (i==round(length(C)*0.8))
        disp("80% reached")
    elseif (i==round(length(C)*0.9))
        disp("90% reached")
    elseif (i==round(length(C)))
        disp("100% reached")
    end
end

[~,resPos] = min(rec);

fprintf('Variables used in the model are: %s lead, %s lead, %s lead, %s lead\n',leafletvar(pos(1,resPos(1))),leafletvar(pos(2,resPos(1))),leafletvar(pos(3,resPos(1))), leafletvar(pos(4,resPos(1))))
fprintf('and the corresponding coefficients of the function are: %f, %f, %f, %f\n', stats{resPos(1)}.eigenvec(1,1), stats{resPos(1)}.eigenvec(2,1), stats{resPos(1)}.eigenvec(3,1), stats{resPos(1)}.eigenvec(3,1))


%%
%%ANALYSIS FOR SIX VARIABLES
v = data_matrix_ICS.vars(1,:);
C = nchoosek(v,6);
stats = cell(length(C),1);
D = cell(length(C),1);
P = cell(length(C),1);
rec = zeros(length(C),2);
pos = zeros(6,length(C));
 
for i = 1:length(C)
    pos(1,i) = find(C(i,1)==data_matrix_ICS.vars(1,:));
    pos(2,i) = find(C(i,2)==data_matrix_ICS.vars(1,:));
    pos(3,i) = find(C(i,3)==data_matrix_ICS.vars(1,:));
    pos(4,i) = find(C(i,4)==data_matrix_ICS.vars(1,:));
    pos(5,i) = find(C(i,5)==data_matrix_ICS.vars(1,:));
    pos(6,i) = find(C(i,6)==data_matrix_ICS.vars(1,:));


    [D{i}, P{i}, stats{i}] = manova2([data_matrix_ICS.vars(:,pos(1,i)) data_matrix_ICS.vars(:,pos(2,i)) data_matrix_ICS.vars(:,pos(3,i)) data_matrix_ICS.vars(:,pos(4,i)) data_matrix_ICS.vars(:,pos(5,i)) data_matrix_ICS.vars(:,pos(6,i))],groups);
    if isstruct(stats{i})==0
        rec(i,:) = 1;
        fprintf("found singular matrix on %d iteration",i)
    else
        rec(i,:) = stats{i}.lambda;
    end
    if (i==round(length(C)*0.1))
        disp("10% reached")
    elseif (i==round(length(C)*0.2))
        disp("20% reached")
    elseif (i==round(length(C)*0.3))
        disp("30% reached")
    elseif (i==round(length(C)*0.4))
        disp("40% reached")
    elseif (i==round(length(C)*0.5))
        disp("50% reached")
    elseif (i==round(length(C)*0.6))
        disp("60% reached")
    elseif (i==round(length(C)*0.7))
        disp("70% reached")
    elseif (i==round(length(C)*0.8))
        disp("80% reached")
    elseif (i==round(length(C)*0.9))
        disp("90% reached")
    elseif (i==round(length(C)))
        disp("100% reached")
    end
end


[val,resPos] = min(rec);


fprintf('Variables used in the model are: %s lead, %s lead, %s lead, %s lead, %s lead, %s lead\n',leafletvar(pos(1,resPos(1))),leafletvar(pos(2,resPos(1))), leafletvar(pos(3,resPos(1))), leafletvar(pos(4,resPos(1))), leafletvar(pos(5,resPos(1))), leafletvar(pos(6,resPos(1))))

%%
%ANALYSIS FOR TWO VARIABLES
v = data_matrix_ICS.vars(1,:);
C = nchoosek(v,2);
stats = cell(length(C),1);
D = cell(length(C),1);
P = cell(length(C),1);
rec = zeros(length(C),2);
pos = zeros(2,length(C));

for i = 1:length(C)
    pos(1,i) = find(C(i,1)==data_matrix_ICS.vars(1,:));
    pos(2,i) = find(C(i,2)==data_matrix_ICS.vars(1,:));
    [D{i}, P{i}, stats{i}] = manova2([data_matrix_ICS.vars(:,pos(1,i)) data_matrix_ICS.vars(:,pos(2,i))],groups);
    if isstruct(stats{i})==0
        rec(i,:) = 1;
        fprintf("found singular matrix on %d iteration",i)
    else
        rec(i,:) = stats{i}.lambda;
    end
    if (i==round(length(C)/4))
        disp("25% reached")
    elseif (i==round(length(C)/2))
        disp("50% reached")
    elseif (i==round(length(C)*0.75))
        disp("75% reached")
    end
end

[val,resPos] = min(rec);


fprintf('Variables used in the model are: %s lead, %s lead, %s lead\n',leafletvar(pos(1,resPos(1))),leafletvar(pos(2,resPos(1))))
fprintf('and the corresponding coefficients of the function are: %f, %f, %f\n', stats{resPos(1)}.eigenvec(1,1), stats{resPos(1)}.eigenvec(2,1), stats{resPos(1)}.eigenvec(3,1))
