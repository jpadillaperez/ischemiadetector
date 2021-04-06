%script to create the leaflet able to compare the results of multivar
%analysis
clear;clc;

leafletvar = "";
for g = 1:9
        leafletvar((g-1)*5+1) = join(["st" num2str(g)]);
        leafletvar((g-1)*5+2) = join(["qt" num2str(g)]);
        leafletvar((g-1)*5+3) = join(["qd" num2str(g)]);
        leafletvar((g-1)*5+4) = join(["ta" num2str(g)]);
        leafletvar((g-1)*5+5) = join(["tp" num2str(g)]);
end
save('leaflet','leafletvar');