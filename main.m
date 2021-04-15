%%main
fclose('all');
clear;clc;close;

% Directories
dirsig = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\StaffIII\data\';
dirhea = dirsig;
dirann = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Annotations_Josechu\';
measdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Measures\';
icsdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\ICSandDelta\';
paramsdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params\';

%Vars
pwl_flag = 0;               %0: no filtering; 1: 60Hz filtering; 2: 50Hz Filtering
standard_flag = 1;          %1: standard analysis; 2:v2-v1 analysis

%Call functions
batch_measures(dirsig, dirhea, dirann, measdir, standard_flag, pwl_flag);
calcdeltaicsindex(measdir, icsdir);
create_data_matrixes(icsdir, paramsdir)

%%
%main for v1-v2 analysis
fclose('all');
clear;clc;close;

% Directories
dirsig = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\StaffIII\data\';
dirhea = dirsig;
dirann = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Annotations_Calculated_60Hz_Filtered\';
measdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Measures(v1-v2,60HzFiltered, pucalculated)\';
icsdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\ICSandDelta(v1-v2,60HzFiltered, pucalculated)\';
normalicsdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\ICSandDelta(60HzFiltered,pucalculated)\';
paramsdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\';

%Vars
pwl_flag = 2;               %0: no filtering; 1: 60Hz filtering; 2: 50Hz Filtering
standard_flag = 0;          %1: standard analysis; 2:v2-v1 analysis

%Call functions
%createpuannot(dirsig, dirann) 
batch_measures(dirsig, dirhea, dirann, measdir, standard_flag, pwl_flag);
calcdeltaicsindex(measdir, icsdir);
create_data_matrixes_v1v2(icsdir, normalicsdir, paramsdir)
%create_data_matrixes(icsdir, paramsdir)



%%crear ics estandar para los 50 Hz y otro para 60 Hz
%despues sacar el v1-v2 para ambos y comparar resultados