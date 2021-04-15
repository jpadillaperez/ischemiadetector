%CLASSIFICATION WITH BAYES THEOREM
%VERY WRONG

function classif_bayes(stats, groups,resPos)
probGr(1) = 0.325; %lad
probGr(2) = 0.217; %cir
probGr(3) = 0.458; %rca


class = zeros(83,1);
probTot = zeros(3,1);
for p = 1:83
    for g = 1:3
        probTot(g) = (stats{resPos}.canon(p,g)*probGr(g))./(stats{resPos}.canon(p,:)*probGr(:));
    end
    [~, pos] = max(probTot);
    class(p) = pos;
end

a = (groups=="lad")*1;
sum(a);
sum(class==1);
c = (groups=="rca")*3;
sum(c)/3;
sum(class==3);
b = (groups=="cir")*2;
sum(b)/2;
sum(class==2);

groups_num = a + b + c;

fprintf('El porcentaje de clasificación correcta es %f',size(nonzeros(class == groups_num),1)*100/83)
end