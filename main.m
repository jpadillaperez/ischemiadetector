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




% %%
% %main for slopes measurements extraction
% 
% clear all; clc; close all;
% % Inicializacion parametros y path  
% sigdir = 'C:\Users\Jorge\GDrive\Universidad\BSICOS\StaffIII\data\';
% 
% addpath('C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\BioSigBrowser\Graphical_mode\BioSigBrowser\ver4',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\BioSigBrowser\Graphical_mode\AnnotationFileManager\working',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\BioSigBrowser\Gral_Functions\working',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\ecgtb_new\ver2',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\filtering\ver2',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\input_output\ver3',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\input_output\biosigt200',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\others\ver1',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\WAVEDET\WAVEDET_DETECTION_TOOLS\ver2',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\WAVEDET\WAVEDET_SINGLE_LEAD\ver1',...
%     'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\WAVEDET\WAVEDET_MULTI_LEAD\devel')
% 
% flags = [2 0 0];
% % flags: [qrs_flag leadsynth_flag flagaux]
% %           qrs_flag: QRS detection only (2), External (1), internal (0) QRS detector (0 by default)
% headir = sigdir;
% matdir = [];
% ft=0; %MIT format
% anot_fmt=[];
% aname=[];
% dirann=[];
% messages=[];
% t=[];
% annot=[];
% fa = 1000;
% outlier_Ne = 50;
% outlier_C = 3.5;
% outlier_plotflag = 0;
% 
% load 'var_dependencies\ListaEcgsJosechu.mat';
% 
% for i = 8 %:length(listOfEcgNumbers)
%     %eval(['ecgnr=' 'deblank(listOfEcgNumbers{i});'])
%     ecgnr = '002d';
%     heasig = readheader([sigdir ecgnr]);
%     tt=[0 heasig.nsamp];
%     sinal = readsignal(sigdir,ecgnr,tt,ft,heasig)';
%     for lead = 4%:heasig.nsig
%         
%         [position,~,~] = wavedet_3D(sigdir,headir,matdir,ecgnr,ft,anot,lead,t,flags,anot_fmt,aname,dirann,messages);
%         a=0;b=0;
%         if ~isempty(position.QRSmainpos) && ~isempty(position.QRSmaininv)
%             for i=1:length(position.qrs)
%                 a = a + sum(position.QRSmainpos == position.qrs(i));
%                 b = b + sum(position.QRSmaininv == position.qrs(i));
%             end
%             if a > 0 && b > 0
%                 if a >= b
%                     position.qrs = position.QRSmainpos;
%                 else
%                     position.qrs = position.QRSmaininv;
%                 end
%             end
%         end
%         CleanAnnot = unique(position.qrs);
%     
%         if isempty(position) && ~isempty(PathAnnot)
%             position.qrs = CleanAnnot((CleanAnnot >= t(1)) & (CleanAnnot <= t(end)));
%             position.Pon = nan(size(position.qrs));
%             position.P = nan(size(position.qrs));
%             position.Poff = nan(size(position.qrs));
%             position.QRSon = nan(size(position.qrs));
%             position.Q = nan(size(position.qrs));
%             position.R = nan(size(position.qrs));
%             position.Rprima = nan(size(position.qrs));
%             position.S = nan(size(position.qrs));
%             position.QRSoff = nan(size(position.qrs));
%             position.Ton = nan(size(position.qrs));
%             position.T = nan(size(position.qrs));
%             position.Tprima = nan(size(position.qrs));
%             position.Toff = nan(size(position.qrs));
%             position.QRSmainpos = nan(size(position.qrs));
%             position.QRSmaininv = nan(size(position.qrs));
%         elseif isempty(position) && isempty(PathAnnot)
%             warning(['Error with delineation, skipping lead ' deblank(sinal(lead,:)) '.'])
% %             continue
%         end
%     
%         Notstime = CleanAnnot - round(80*fa/1000); %Set the nots possitions
%         if Notstime(1) <= 0              %Avoid first not out of vector
%             Notstime(1) = 1;
%         end
%         sig = baseline2(sinal(:,lead),Notstime(1:end)',1);
%         
%         %sig = filt_lowpass(sig).';
%         
%         eval(['[Usu' num2str(lead) '.sig,Usu' num2str(lead) '.t,Dsu' num2str(lead) '.sig,Dsu' num2str(lead) '.t]=pendcalc(position,sig,1,1,fa)']);
%         eval(['Usu' num2str(lead) '.t = Usu' num2str(lead) '.t/1000;']);
%         eval(['Dsu' num2str(lead) '.t = Dsu' num2str(lead) '.t/1000;']);
% 
%         eval(['signoU = nansum(sign(Usu' num2str(lead) '.sig));']);
%         eval(['signoD = nansum(sign(Dsu' num2str(lead) '.sig));']);
%         if signoU>0
%             eval(['Usu' num2str(lead) '_or.t = Usu' num2str(lead) '.t(Usu' num2str(lead) '.sig>0);']);
%             eval(['Usu' num2str(lead) '_or.sig = Usu' num2str(lead) '.sig(Usu' num2str(lead) '.sig>0);']);
%         elseif signoU<0
%             eval(['Usu' num2str(lead) '_or.t = Usu' num2str(lead) '.t(Usu' num2str(lead) '.sig<0);']);
%             eval(['Usu' num2str(lead) '_or.sig = Usu' num2str(lead) '.sig(Usu' num2str(lead) '.sig<0);']);
%         end
%         if signoD>0
%             eval(['Dsu' num2str(lead) '_or.t = Dsu' num2str(lead) '.t(Dsu' num2str(lead) '.sig>0);']);
%             eval(['Dsu' num2str(lead) '_or.sig = Dsu' num2str(lead) '.sig(Dsu' num2str(lead) '.sig>0);']);
%         elseif signoD<0
%             eval(['Dsu' num2str(lead) '_or.t = Dsu' num2str(lead) '.t(Dsu' num2str(lead) '.sig<0);']);
%             eval(['Dsu' num2str(lead) '_or.sig = Dsu' num2str(lead) '.sig(Dsu' num2str(lead) '.sig<0);']);
%         end
%         
%         % Median Absolute Deviation:
%         eval(['Usu' num2str(lead) '_or.sig = Usu' num2str(lead) '_or.sig(diff(Usu' num2str(lead) '_or.t)~=0);']);
%         eval(['Usu' num2str(lead) '_or.t = Usu' num2str(lead) '_or.t(diff(Usu' num2str(lead) '_or.t)~=0);']);
%         eval(['[Usu' num2str(lead) '_or.sig,Usu' num2str(lead) '_or.t] = outlier_correction_by_std(Usu' num2str(lead) '_or.sig, Usu' num2str(lead) '_or.t, outlier_Ne, outlier_C, 0, 0, 0, outlier_plotflag);']);
%         eval(['Dsu' num2str(lead) '_or.sig = Dsu' num2str(lead) '_or.sig(diff(Dsu' num2str(lead) '_or.t)~=0);']);
%         eval(['Dsu' num2str(lead) '_or.t = Dsu' num2str(lead) '_or.t(diff(Dsu' num2str(lead) '_or.t)~=0);']);
%         eval(['[Dsu' num2str(lead) '_or.sig,Dsu' num2str(lead) '_or.t] = outlier_correction_by_std(Dsu' num2str(lead) '_or.sig, Dsu' num2str(lead) '_or.t, outlier_Ne, outlier_C, 0, 0, 0, outlier_plotflag);']);
% 
%     end
% end
%       