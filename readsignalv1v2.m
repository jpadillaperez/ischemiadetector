function [signal,messages,hd] = readsignal(sigdir,signr,t,ft,hd,leads,messages)

% Brief function description:
%      The function reads the signal from file (specified by 'sigdir' and
% 'signr') and stores the signal in the output matrix 'signal'.
% Where rows are number of leads and columns are number of samples.
% function signal = readsignal(sirdir,signr,t,ft,hd)
% in:
% sigdir = directory where is the signal file.
% signr = name of the signal file.
% t = time segment to be read; two element vector [t(1) t(2)] which specifies onset and offset
% the segment to be read (t is in samples); t=[] stands for all signal
% ft = data format; ft = 1 (LUND format); ft = 0 (MIT format)
%                   ft = 4 (Mortara Format); ft= 5 (GDF Format)
%                   ft= 2 (MAT format)
% hd = header information about the recording.
% leads = signal leads to be read (optional)
%
% out:
% signal = piece of signal in the interval selected by t variable.
%          size(signal) = [leads x samples];
% messages = error/warning mensages and setup information
% hd = header of the signal
%   Version 1
%   Created by Juan Bolea (jbolea@unizar.es) on January 13, 2009.
%   Modified by Rute Almeida (rbalmeid@unizar.es) on MAR 15, 2010.

if nargin<7
    messages.setup=[];
end

if ~isfield(messages,'setup')
    messages.setup=[];
end

if ~isfield(messages,'errors')
    messages.errors=[];
end
if ~isfield(messages,'errors_desc')
    messages.errors_desc=[];
end

if ~isfield(messages,'warnings')
    messages.warnings=[];
end
if ~isfield(messages,'status')
    messages.status=1;
end

% check input
if nargin < 4
    messages.errors=[messages.errors {['error on readsignal: wrong number of inputs']}];
    messages.errors_desc=[messages.errors_desc {'four input arguments are required'}];
    warning(char(messages.errors(end)))
    messages.status=0;
    signal=[];
    return
end

if ft~=0 & ft~=1 & ft~=2 & ft~=4 & ft~=5
    messages.errors=[messages.errors {['error on readsignal: format not supported']}];
    messages.errors_desc=[messages.errors_desc {'ft=0,1,2,3,4 allowed; see help for details'}];
    warning(char(messages.errors(end)))
    messages.status=0;
    signal=[];
    return
end

if ~isempty(t)
    if round(t)~=t
        t=[];
        messages.warnings=[messages.warnings {['invalid time segment; all signal is read instead']}];
        warning(char(messages.warnings(end)))
    end
end


% if nargout==3 & nargin>=5
%     hd=heasig;
% end


if ft == 1   %LUND format
    try
        if ~isempty(t)
            t(1)=max(t(1),1);
            if exist('leads','var') %25MAR2010
                signal = getsig(sigdir,signr,t,leads); %25MAR2010
            else
                signal = getsig(sigdir,signr,t);
                leads=1:size(signal,1);
            end
        else
            signal = getsig(sigdir,signr);
            if exist('lead','var')
                signal = signal(leads,:);
            else
                leads=1:size(signal,1);
            end
        end
        messages.setup.file=[sigdir signr];
        if nargout==3 && (~ exist('hd','var')|| isempty(hd)) %13MAY2010
            hd = gethdsig(sigdir,signr);
            hd = hdsig2heasig(hd);%25MAR2010
        end
    catch
        signal=[];hd=[];
        messages.errors=[messages.errors {['error on readsignal']}];
        messages.errors_desc=[messages.errors_desc {lasterr}];
        warning(char(messages.errors(end)))
        messages.status=0;
        return
    end
elseif ft == 0  %MIT format
    if ~isempty(strfind(signr,'.hea'))
        signr(strfind(signr,'.hea')-1:end) = [];
    end
    if ~exist('hd','var') || isempty(hd) % 13MAY2010
        try
            name=[sigdir signr '.hea'];
            hd = readheader(name);
            messages.warnings=[messages.warnings {['header file was correctly read']}];
            warning(char(messages.warnings(end)))
        catch
            signal=[];hd=[];
            messages.errors=[messages.errors {['error on readsignal: no header information']}];
            messages.errors_desc=[messages.errors_desc {lasterr}];
            warning(char(messages.errors(end)))
            messages.status=0;
            return
        end
    end
    if ~isempty(t)
        %         t(1)=t(1)-1;
    else
        t=[0 hd.nsamp];
    end
    
    if ~exist('leads','var') % 20ABRIL2010
        leads = 1:hd.nsig;
        messages.warnings=[messages.warnings {'number of leads not provided; all leads all kept instead'}];
        warning(char(messages.warnings(end)))
    else
        if isempty(leads) % 05MAY2010
            leads = 1:hd.nsig;
            messages.warnings=[messages.warnings {'number of leads not provided; all leads all kept instead'}];
            warning(char(messages.warnings(end)))
        end
    end
    if isfield(hd,'nsegm')
        sumsampsegm = [0 hd.sumsampsegm];
        ini_seg = max(find(t(1)> sumsampsegm))+1;
        fin_seg = max(find(t(2)> sumsampsegm))+1;
        if ~isfield(hd,'spf')
            hd.spf = ones(1,hd.nsig);
        end
        signal = NaN(hd.nsig,(t(2)-t(1)+1)*(max(hd.spf))); %15MAR2010
        for k = ini_seg:fin_seg
            if (k == ini_seg)&&(k == fin_seg)
                t_prima = t;
            elseif (k ~= ini_seg)&&(k ~= fin_seg)
                t_prima = [sumsampsegm(k-1)+1 sumsampsegm(k)];
            elseif (k ~= ini_seg)&&(k == fin_seg)
                t_prima = [sumsampsegm(k-1)+1 t(2)];
            elseif (k == ini_seg)&&(k ~= fin_seg)
                t_prima = [t(1) sumsampsegm(k)+1];
            end
            if k > 1
                t_prima1 = t_prima-sumsampsegm(k-1);
            end
            if isfield(hd.hd{k-1},'nsig')
                desc = cellstr(hd.desc);
                [signal1 messages] = readsignal(sigdir,hd.hd{k-1}.recname,t_prima1,ft,hd.hd{k-1},1:hd.hd{k-1}.nsig);
                if ~isempty(signal1)
                    for i =1:hd.hd{k-1}.nsig
                        desc1 = cellstr(deblank(strtrim(hd.hd{k-1}.desc(i,:))));
                        [c ia ib] = intersect(desc,desc1);
                        indx(i) = ia;
                        signal(indx(i),t_prima(1)-t(1)+1:t_prima(1)-t(1)+length(signal1(i,:))) = signal1(i,:);
                    end
                end
            end
        end            
    else
        try
            %this is necessary when there are leads in different files.   e.g. ptbdb database  JP 2006
            leadsfile=[];
            leadinfile=[];
            nsiginfile=[];
            for jj=1:hd.nsig
                for kk=1:hd.nsig
                    leadsfile(kk)=strcmp(hd.fname(jj,:),hd.fname(kk,:));
                end
                leadsfile = cumsum(leadsfile);
                leadinfile(jj) = leadsfile(jj);  % lead indexes in the file
                nsiginfile(jj) = leadsfile(end); % number of the leads in th file nsiginfile<=hd.nsig
            end
            
            parts = length(find(leadinfile == 1));
            posparts = find(leadinfile == 1);
            
            if ~isfield(hd,'spf')
                hd.spf = ones(1,hd.nsig);
            end
            
            signal = NaN(hd.nsig,(t(2)-t(1)+1)*(max(hd.spf))); %15MAR2010
            posparts=[posparts hd.nsig+1];%15MAR2010
            for i = 1:parts
                %%%%%%%%% %15MAR2010
                if  sum((posparts(i+1)-1)>=leads)>0 %15MAR2010
                    hsig = heasig2one(hd,posparts(i):(nsiginfile(posparts(i))+posparts(i)-1));
                    
                    if length(hsig.spf) > hsig.nsig
                        spf = hsig.spf(1:hsig.nsig);
                    else
                        spf = hsig.spf;
                    end
                    if ~isempty(spf)    %% t is in samples of the minimum sampling rate
                        agrupacion = sum(spf);   %% This is the block of one second
                        %% Signal will have the length of the maximum sampling rate
                    end
                    
                    fid=fopen([sigdir hsig.fname(1,:)],'rb');
                    try
                        if length(unique(hsig.spf)) == 1  %JUAN 23/08/2010
                            sig = getvec(fid,hsig,t(1),t(2)+1,sigdir);
                            if size(sig,1) > t(2)-t(1)
                                sig = sig(1:t(2)-t(1),:);
                            end
                            if size(sig,2) == hd.nsig
                                sig = sig';
                            end
                            if isempty(sig)
                                error;
                            end
                            if isnan(sig)
                                error;
                            end
                            %                 try
                            %                             signal(posparts(i):(nsiginfile(posparts(i))+posparts(i)-1),1:length(sig)) = sig;
                            signal(posparts(i):(nsiginfile(posparts(i))+posparts(i)-1),1:size(sig,2)) = sig;
                            %                 catch
                            %                     signal = sig;
                            %                 end
                        else
                            error;
                        end
                        
                        
                    catch me
                        if ~strcmp(me.identifier,'Getvec:OutOfBounds')                                                    
%                             throw(me)
%                         else
                            clear signal;
                            %                         if(length(find(hsig.fmt == 16)) == hsig.nsig)
                            fseek(fid,agrupacion*(t(1))*2,'bof');    %% It takes the position of the correspondent block
                            checkend(fid);
                            if hsig.fmt(1) == 16
                                x1 = fread(fid,[agrupacion t(2)-t(1)+1], 'int16');  %% And it reads all block between t(1) and t(2)
                            elseif hsig.fmt(1) == 212   %JUAN 23/08/2010  MIMIC DB
                                hg = hsig;
                                hg.nsig = 1;                                
                                x1 = getvec(fid,hg,t(1)*agrupacion,t(2)*agrupacion,sigdir);
                                try
                                    x1(agrupacion*floor(size(x1,1)/agrupacion)+1:end) = [];
                                catch
                                end
                                x1 = reshape(x1,agrupacion,floor(size(x1,1)/agrupacion));
                                %                                 if size(x1,2) == hd.nsig
                                %                                     x1 = x1';
                                %                                 end
                            end
                            for k =1:hsig.nsig
                                ini_pos_lead = sum(hsig.spf(1:k))-hsig.spf(k)+1;
                                end_pos_lead = sum(hsig.spf(1:k));
                                vector_lead = reshape(x1(ini_pos_lead:end_pos_lead,:),[],1);
                                vector_lead(isnan(vector_lead)) = [];   %JUAN 23/08/2010
                                signal(k,1:length(vector_lead)) = vector_lead;    %JUAN 23/08/2010
                                %                                 signal(k,1:(t(2)-t(1)+1)*hsig.spf(k)) =
                                %                                 vector_lead;  %JUAN 23/08/2010
                                aux1 = NaN(1,size(signal,2));
                                posiciones = 1:max(hsig.spf)/hsig.spf(k):size(signal,2);
                                aux1(posiciones) = signal(k,1:size(signal,2)/(max(hsig.spf)/hsig.spf(k)));
                                signal(k,:) = aux1;
                            end
                            clear x1
                        else
                            rethrow(me);
                        end
                        %                         end
                    end
                    fclose(fid);
                    %             if size(signal,1) ~= hd.nsig  %Rute 26/01/10
                    %                 signal = signal';  %Rute 26/01/10
                    %             end            %Rute 26/01/10
                end %15MAR2010
                %             end
            end                                      
            
            %Rute 26/01/10
            if exist('leads','var')
                try
                    signal=signal(2,:)-signal(1,:);
                    for j = 1:size(signal,1)
                        signal(j,:) = filtradoRed(signal(j,:),1000,60);
                    end
                    %debugging flag
                catch
                    messages.warnings=[messages.warnings {['wrong number of leads; all leads all kept instead']}];
                    warning(char(messages.warnings(end)))
                    leads=1:size(signal,1);
                end
            else
                leads=1:size(signal,1);
            end
            %Rute 26/01/10
            % clear signal1
            
            if isfield(hd,'units')
                for k=1:hd.nsig
                    if isempty(deblank(hd.units(k,:)))  %JUAN 23/08/2010
                        units{k} = 'mV';
                    else
                        units{k}=hd.units(k,:);
                    end
                end
            else
                messages.warnings=[messages.warnings {['no signal units given: millivolts assumed']}];
                units(1:hd.nsig) = {'millivolts'};
            end
            
            for k=1:size(signal,1)
                if isfield(hd,'adczero')
                    signal(k,:) = signal(k,:)-hd.adczero(leads(k));
                end
                signal(k,:)=(signal(k,:)./hd.gain(leads(k)));
                %          if isfield(hd,'units')
                if strcmp(deblank(upper(char(units{leads(k)}))),'MV')||strcmp(deblank(upper(char(units{leads(k)}))),'MILLIVOLTS')||...
                        strcmp(deblank(upper(char(units{leads(k)}))),'MILIVOLTIOS')
                    signal(k,:) = signal(k,:)*1e3; % conversion to microV
                    messages.warnings=[messages.warnings {['signal units changed: converted from milivolts to microvolts']}];
                    warning(char(messages.warnings(end)))
                    units{leads(k)} = 'microvolts';
                elseif strcmp(deblank(upper(char(units{leads(k)}))),'V')||strcmp(deblank(upper(char(units{leads(k)}))),'VOLTS')||...
                        strcmp(deblank(upper(char(units{leads(k)}))),'VOLTIOS')
                    signal(k,:) = (signal(k,:))*1e6; % conversion to microV
                    messages.warnings=[messages.warnings {['signal units changed: converted from volts to microvolts']}];
                    warning(char(messages.warnings(end)))
                    units{leads(k)} = 'microvolts';
                elseif strcmp(deblank(upper(char(units{leads(k)}))),'MMHG')  % Update JUAN 23/08/2010 MIMIC DB
                    signal(k,:) = signal(k,:)*100; % conversion to microV
                    messages.warnings=[messages.warnings {['signal units changed: converted from milivolts to microvolts']}];
                    warning(char(messages.warnings(end)))
                    units{leads(k)} = 'mmhg';
                    %             else
                    %                 sig = sig*1e3;
                elseif strcmp(deblank(upper(char(units{leads(k)}))),'MICROV')||strcmp(deblank(upper(char(units{leads(k)}))),'MICROVOLTS')||...
                        strcmp(deblank(upper(char(units{leads(k)}))),'MICROVOLTIOS')
                end
                messages.setup.file=[sigdir signr];
                %             else
                %                 signal(k,:) = signal(k,:).* 1e3;  %% by default
                %                 messages.warnings=[messages.warnings {['no signal units given: milivolts assumed']}];
                %                 warning(char(messages.warnings(end)))
                %                 messages.warnings=[messages.warnings {['signal units changed: converted from milivolts to microvolts']}];
                %                 warning(char(messages.warnings(end)))
                %                 hd.units = {(char(ones(hd.nsig,1)*'milivolts'))};
                %                 units{leads(k)} = 'microvolts';
                %             end
            end
            hd.units=char(units);
            % Juan 17/10/2012
            try 
                signal(:,isnan(signal(1,:))) = [];
            end 
            % Juan 17/10/2012
            
        catch me
            signal=[];
            messages.errors=[messages.errors {['error on readsignal']}];
            messages.errors_desc=[messages.errors_desc {lasterror}];
            warning(char(messages.errors(end)))
            messages.status=0;
            leads=[]; %20ABRL2010
            rethrow(me);
        end
    end
    t(1)=t(1)+1;
elseif ft == 3  %% European Data Format (EDF) (t in samples in readsignal)
    %%
    [data, header] = readEDF([sigdir signr]);    
    hd = headerEDF2MIT(header);
    if length(lead) == 1;
        signal = data{lead};
        t = t*hd.spf(lead);
        signal = signal(t(1):t(2),1);
    else
        spf = hd.spf(lead);
        t = t*max(spf);
        signal = [];
        for j = 1:length(lead)
            eval(['signal' num2str(j) ' = data{lead(j)};']);
            eval(['signal' num2str(j) ' = resample(signal' num2str(j) ',spf(j),min(spf));']);
            signal = [signal eval(['signal' num2str(j)])];
        end
        signal = signal(t(1):t(2),:);        
    end        
    
elseif ft == 4  %% Mortara Format
    %%
    if ~exist('leads','var') || isempty(leads) %13MAY2010
        leads=1:12;
    end
    if ~exist('hd','var') || isempty(hd)  %13MAY2010
        hd = headermortara(sigdir,signr);
        messages.warnings=[messages.warnings {'Standard Info of Mortara recordings assumed; see headermortara.m'}];
        warning(char(messages.warnings(end)))
    end
    if isempty(t) %15MAR2010
        t=[1 hd.freq*60*60]; %15MAR2010
    end %15MAR2010
    
    
    try
        if isempty(strfind(signr,'.bin')) signr=[signr '.bin']; end
        aux=strfind(upper(signr),upper('Hour1RawData'));
        if isempty(aux)%single hour file: local t axes
            [signal]=readH08ECG([sigdir signr],t(1),t(2)-t(1)+1,leads);
            %             signal=signal';
            messages.setup.file=[sigdir signr];
            messages.warnings=[messages.warnings {'single hour file assumed: local t axes'}];
            warning(char(messages.warnings(end)))
        else  %posible multifile recording: global t axes
            if (t(2)<(hd.freq*60*60+1)) && size(t,1) == 1  %% Juan 23/06/2010
                %             if (t(2)<(hd.freq*60*60+1))
                [signal]=readH08ECG([sigdir signr],t(1),t(2)-t(1)+1,leads);
                %                 signal=signal';
                messages.setup.file=[sigdir signr];
            else
                messages.warnings=[messages.warnings {'multifile recording: global t axes'}];
                warning(char(messages.warnings(end)))
                messages.setup.file=[];
                signal=[];
                
                for i = 1:size(t,1)
                    first_file(i) = min(find(t(i,1)<(1:25)*60*60*hd.freq));
                    last_file(i)= min(find(t(i,2)<(1:25)*60*60*hd.freq));
                end
                
                %first_file=find(t(:,1)<(1:25)*60*60*hd.freq);
                %first_file=first_file(1);
                %last_file=find(t(:,2)<(1:25)*60*60*hd.freq);
                %last_file=last_file(1);
                %for f=first_file:last_file
                files = unique([first_file last_file]);
                for f1=1:length(files)
                    f = files(f1);
                    signr_f=[signr(1:(aux-1)) 'Hour' num2str(f) 'RawData' signr((aux+12):end)];
                    messages.setup.file=[messages.setup.file {[sigdir signr_f]}];
                    %% 27/10/2010 Juan
                    i_tlocal = t(:,1)<=(60*60*hd.freq*(f));
                    f_tlocal = t(:,2)<=(60*60*hd.freq*(f));
                    for j1 = 1:size(t,1)
                        if isequal(i_tlocal(j1),0)
                            t_local(j1,1) = (60*60*hd.freq*(f-1))+1;
                        else
                            t_local(j1,1) = t(j1,1);
                        end
                        if isequal(f_tlocal(j1),0)
                            t_local(j1,2) = (60*60*hd.freq*(f))-1;
                        else
                            t_local(j1,2) = t(j1,2);
                        end
                    end
                    %% 27/10/2010 Juan
                    
                    %                     t_local=t(t(:,1)<=(60*60*hd.freq*(f)) | t(:,2)<=(60*60*hd.freq*(f)),:);
                    t_local=[max(t_local(:,1)-60*60*hd.freq*(f-1),1) min(t_local(:,2)-60*60*hd.freq*(f-1),60*60*hd.freq*f)];
                    t_local(t_local(:,2)<0,:)=[];
                    try %12ABRIL
                        [signal_local,lead_label,time_vec]=readH08ECG([sigdir signr_f],t_local(:,1),t_local(:,2)-t_local(:,1)+1,leads);
                    catch me %12ABRIL
                        signal_local=[]; %12ABRIL
                        messages.errors=[messages.errors {'no fatal error on readsignal'}]; %12ABRIL2010
                        messages.errors_desc=[messages.errors_desc {[me.message ':' signr_f ]}]; %12ABRIL2010
                        warning(char(messages.errors(end))) %12ABRIL
                    end
                    signal=[signal,signal_local];
                    %%%%%%%%12ABRIL
                end
            end
        end
    catch
        signal=[];hd=[];
        messages.errors=[messages.errors {'error on readsignal'}];
        messages.errors_desc=[messages.errors_desc {lasterr}];
        warning(char(messages.errors(end)))
        messages.status=0;
    end
    
elseif ft == 5  %% GDF Format
    try
        try
            [signal,HDR] = sload([sigdir signr]);
            hd = heaGDF2MIT(HDR);
            signal = signal';
        catch                                    
            HDR = sopen([sigdir signr], 'r');
            hd = heaGDF2MIT(HDR);
            if isempty(t)
                t=[1 hd.nsamp];
            end
            
            %         HDR.SampleRate = HDR.tmp;
            [signal,HDR] = sread(HDR, t(2)-t(1), t(1)+hd.offset*16);
            signal = signal';
            HDR = sclose(HDR);
            %         if nargin==6
            %             signal=signal(leads);
            %         end
            messages.setup.file=[sigdir signr];
        end
    catch
        
        try
            d = dir([sigdir signr '.*']);
            for i = 1:length(d)
                try
                    HDR = sopen([sigdir d(i).name],'r');
                    hd = heaGDF2MIT(HDR);                    
                    break;
                catch
                end
            end
            if isempty(t)
                t=[1 hd.nsamp];
            end
            
            %         HDR.SampleRate = HDR.tmp;
            [signal,HDR] = sread(HDR, t(2)-t(1), t(1)+hd.offset*16);
            signal = signal';
            HDR = sclose(HDR);
            %         if nargin==6
            %             signal=signal(leads);
            %         end
            messages.setup.file=[sigdir signr];
        catch me                                 
            signal=[];hd=[];
            messages.errors=[messages.errors {'error on readsignal'}];
            messages.errors_desc=[messages.errors_desc {me.message}];
            warning(char(messages.errors(end)))
            messages.status=0;
        end
    end
    for i = 1:size(signal,1)
        [indx1{i}] = find(isnan(signal(i,:)));
        for j = 1:length(indx1{i})
            signal(i,indx1{i}(j)) = signal(i,indx1{i}(j)-1);
        end
    end
%     [indx, indy] = find(isnan(signal));
%     signal(indx,indy) = signal(indx,indy');
elseif ft == 2  %% Mat format
    try
%         matcontents = {};
        matcontents = load([sigdir signr]);
        names = fieldnames(matcontents);
    catch me
        signal = [];
        messages.errors=[messages.errors {'error on readsignal: unable to read the mat file'}];
        messages.errors_desc=[messages.errors_desc {me.message}];
        warning(char(messages.errors(end)));
        messages.status=0;
        return
    end
    try
        if isfield(matcontents,'sinal')
            signal=matcontents.sinal;
            messages.warnings=[messages.warnings {'variable sinal assumed as data'}];
            warning(char(messages.warnings(end)))
        elseif isfield(matcontents,'sig')
            signal=matcontents.sig;
            messages.warnings=[messages.warnings {'variable sig assumed as data'}];
            warning(char(messages.warnings(end)))
        elseif isfield(matcontents,'signal')
            signal=matcontents.signal;
            messages.warnings=[messages.warnings {'variable signal assumed as data'}];
            warning(char(messages.warnings(end)))
        elseif isfield(matcontents,'data')
            signal = matcontents.data*1000;
            messages.warnings=[messages.warnings {'variable data assumed as data'}];
            warning(char(messages.warnings(end)))
        else
            error;
        end
        
    catch me
        try
            MaxBytes = 0;
            cand = [];
            k = 1;
            for i = 1:length(names)
                if isnumeric(eval(['matcontents.' names{i} ]))
                    eval([names{i} '= matcontents.' names{i} ';']);
                    a(k) = whos(names{i});
                    if a(k).bytes >= MaxBytes
                        cand = i;
                        MaxBytes = a(k).bytes;
                    end
                end                
            end
            if ~isempty(cand)
                signal=matcontents.(names{cand});
                messages.warnings=[messages.warnings {['variable ' names{nfield} ' assumed as data']}];
                warning(char(messages.warnings(end)))
            else
                messages.errors=[messages.errors {'error on readsignal'}];
                messages.errors_desc=[messages.errors_desc {me.message}];
                warning(char(messages.errors(end)));
                messages.status=0;
                signal = [];
                return
            end
            
%             checksignal=0;
%             nfield=0;
%             while checksignal==0 && nfield<length(names)
%                 nfield=nfield+1;
%                 aux=size(matcontents.(names{nfield}));
%                 if checksignal==0
%                     if ~isempty(leads)
%                         if aux(1)>=max(leads)&&aux(2)>=max(leads)  %%% Leads no esta definido en ningun sitio salvo al principio
%                             checksignal=1;
%                             signal=matcontents.(names{nfield});
%                             messages.warnings=[messages.warnings {['variable ' names{nfield} ' assumed as data']}];
%                             warning(char(messages.warnings(end)))
%                         end
%                     else
%                         
%                     end
%                 end
%             end
        catch me
            
        end
    end
    if size(signal,1)>size(signal,2)
        signal=signal';
        messages.warnings=[messages.warnings {'transposed signal in .mat file'}];
        warning(char(messages.warnings(end)));
    end
    [hd,messages_gethdmat] = gethdmat(sigdir,signr,matcontents);
    messages.warnings=[messages.warnings messages_gethdmat.warnings];
    messages.errors=[messages.errors messages_gethdmat.errors];
    messages.errors_desc=[messages.errors_desc messages_gethdmat.errors_desc];
    if exist('leads','var')
        try
            if size(signal,1) ~= length(leads)
                signal=signal(leads,:);
            end
        catch
            messages.warnings=[messages.warnings {['imposible to find requested leads=[' num2str(leads) ']; all signal leads all kept instead']}];
            warning(char(messages.warnings(end)));
            leads=1:size(signal,1);
        end
    else
        leads=1:size(signal,1);
    end
    
%     factor = max(hd.spf);
%     t = t*factor;
    
    if ~isempty(t)
        if t(1) == 0
            t(1) = 1;
        end
        if size(t,1) == 1
            try
                signal=signal(:,t(1):t(2));
            catch me
                messages.errors=[messages.errors {'error on readsignal'}];
                messages.errors_desc=[messages.errors_desc {me.message}];
                warning(char(messages.errors(end)));
                messages.status=0;
                %             excepcion = MException('','');
                %             throw (excepcion);
                signal = [];
                return
            end
        else
            try
                %                 indx = intervalmatrix(t');  %problemas de memoria;
                sig = [];
                for i = 1:length(t)
                    sig = [sig signal(:,t(i,1):t(i,2))];
                end
                clear signal;
                signal = sig;
            catch me
                messages.errors=[messages.errors {'error on readsignal'}];
                messages.errors_desc=[messages.errors_desc {me.message}];
                warning(char(messages.errors(end)));
                messages.status=0;
                %             excepcion = MException('','');
                %             throw (excepcion);
                signal = [];
                return
            end
        end
    end
end

%%%%%%%%% 13 ABRIL
if ~isfield(messages.setup,'t') %13ABRI2010
    messages.setup.t=t;
end
if ~isfield(messages.setup,'nsig') %13ABRI2010
    if exist('leads','var')
        messages.setup.nsig=leads;
    else
        messages.setup.nsig = 1:hd.nsig;
    end
end

if isempty(signal)
    messages.errors=[messages.errors {['error on readsignal']}]; %12ABRIL2010
    messages.errors_desc=[messages.errors_desc {['empty  signal']}]; %12ABRIL2010
    warning(char(messages.errors(end))) %12ABRIL2010
    messages.status=0;
    return
end
%%%%%%%%% 13 ABRIL

%%%%%%% 08/04/2011
function checkend(fid)
checkfid = ferror(fid);
if strcmp(checkfid,'At end-of-file.')
elseif strcmp(checkfid,'Offset is bad - after end-of-file or last character written.')
    ME = MException('Getvec:OutOfBounds', ...
        'Offset is bad - after end-of-file or last character written.');
    throw(ME);
end