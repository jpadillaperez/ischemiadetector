function createpuannot(sigdir, outputdir)
mkdir(outputdir);
% Inicializacion parametros y path
addpath('C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\BioSigBrowser\Graphical_mode\BioSigBrowser\ver4',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\BioSigBrowser\Graphical_mode\AnnotationFileManager\working',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\BioSigBrowser\Gral_Functions\working',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\ecgtb_new\ver2',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\filtering\ver2',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\input_output\ver3',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\input_output\biosigt200',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\tools\others\ver1',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\WAVEDET\WAVEDET_DETECTION_TOOLS\ver2',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\WAVEDET\WAVEDET_SINGLE_LEAD\ver1',...
    'C:\Users\Jorge\GDrive\Universidad\BSICOS\stable\WAVEDET\WAVEDET_MULTI_LEAD\devel')

flags = [0 0 0];
% flags: [qrs_flag leadsynth_flag flagaux]
%           qrs_flag: QRS detection only (2), External (1), internal (0) QRS detector (0 by default)
headir = sigdir;
matdir = [];
ft=0; %MIT format
anot_fmt=[];
aname=[];
dirann=[];
messages=[];
t=[];
annot=[];

load 'var_dependencies\ListaEcgsJosechu.mat';

for i = 1:length(listOfEcgNumbers)
    eval(['ecgnr=' 'deblank(listOfEcgNumbers{i});']);
    heasig = readheader([sigdir ecgnr]);
    tt=[0 heasig.nsamp];
    for l = 1:heasig.nsig
        anot = ['internal' num2str(l)];
        positionqrs = wavedet_3D(sigdir,headir,matdir,ecgnr,ft,anot,l,t,flags,anot_fmt,aname,dirann,messages);
        aux = readannot([pwd '\' ecgnr '.internal' num2str(l)],tt);
        annot = [annot aux];
        save([outputdir 'pu_' ecgnr],'annot');
    end
    l = 1;
    anot = ['extra'];
    positionqrs = wavedet_3D_extra(sigdir,headir,matdir,ecgnr,ft,anot,l,t,flags,anot_fmt,aname,dirann,messages);
    aux = readannot([pwd '\' ecgnr '.extra'],tt);
    annot = [aux annot]; %in first position
    save([outputdir 'pu_' ecgnr],'annot');
    
    annot = [];
end

% 
% for i = 1:length(listOfEcgNumbers)
%     eval(['ecgnr=' 'deblank(listOfEcgNumbers{i});']);
%     load(['pu_' ecgnr])
%     annot(1,1) = annot(1,10);
%     annot = annot(1,1:9);
%     save(['pu_' ecgnr],'annot');
% end