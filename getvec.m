function y = getvec(fid,heasig,x1,x2,dirsig)
% reads the piece of signal between x1 & x2
% returns each signal as a column of a matrix to ease plotting
% Esta funcion todavia esta por retocar para poder aceptar todos
% los formatos de lectura (Lund, DB:16,61,8,160,212,ideal,etc)
% Modified 13MAY2010 J.Bolea & R. Almeida
% Last Update 12/07/2011 Mariano

% Leer los datos segun el formato

if heasig.fmt(1)==8,
    y = [];
elseif heasig.fmt(1)==16 || heasig.fmt(1) == 61
    if isfield(heasig,'offset')
        fseek(fid(1),heasig.offset(1)+2*(x1-1)*heasig.nsig,-1); %skips the offset and then, x1-1 measurements of a single time corresponding to each of the 9 leads. Multiplies by 2 becuase each measurement occupies 2 
    else
        fseek(fid(1),2*(x1-1)*heasig.nsig,-1);
    end
    checkend(fid(1));
    y=fread(fid(1),[heasig.nsig,x2-x1],'int16');
    if (strcmp(computer,'SOL2') && heasig.fmt(1) == 16) || (~strcmp(computer,'SOL2') && heasig.fmt(1) == 61)
        y=swap16(y);
    end
elseif heasig.fmt(1) == 32
    if isfield(heasig,'offset')
        fseek(fid,heasig.offset(1)+4*(x1-1)*heasig.nsig,-1);
    else
        fseek(fid,4*(x1-1)*heasig.nsig,-1);
    end
    checkend(fid);
    y=fread(fid,[heasig.nsig,x2-x1],'int32');
elseif heasig.fmt(1)==80,
    if isfield(heasig,'offset')
        fseek(fid,heasig.offset(1)+(x1-1)*heasig.nsig,-1);
    else
        fseek(fid,(x1-1)*heasig.nsig,-1);
    end
    checkend(fid);
    y = fread(fid,[heasig.nsig,x2-x1],'uint8')-2^7;
elseif heasig.fmt(1)==160,
    if isfield(heasig,'offset')
        fseek(fid,heasig.offset(1)+2*(x1-1)*heasig.nsig,-1);
    else
        fseek(fid,2*(x1-1)*heasig.nsig,-1);
    end
    checkend(fid);
    y=fread(fid,[heasig.nsig,x2-x1],'uint16')-2^15;
elseif heasig.fmt(1)==212,
    if exist('rdsign212','file')==3
        try
            y=rdsign212([dirsig heasig.fname(1,:)],heasig.nsig,x1,x2);
%             if size(y,1) > x2-x1
%                 y(end) = [];
%             end
        catch
            warning(strcat('File',32,heasig.fname(1,:),32,...
                'not found'));
            y = [];
            return;
        end
    else
%         heasig.group(1:heasig.nsig,:) = 1;
        for i=1:heasig.nsig
            %             fseek(fid,heasig.group(i,:)*3/2*x1,-1);
            fseek(fid,1*3/2*x1,-1);
%             try
                checkend(fid);
%             catch
%                 
%             end
            %data=fread(fid,[3 (heasig.group(1,:)*(x2-x1)/2)],'uchar');
            
            data=fread(fid,[3 (heasig.group(1)*(x2-x1)/2)],'uchar');  % JG 020399
            low=rem(data(2,:),16);
            samples(1:2:heasig.group(i)*(x2-x1)-1)=data(1,:)+256*low-(low>7)*4096;
            low=data(2,:)-low;
            samples(2:2:heasig.group(i)*(x2-x1))=data(3,:)+16*low-(low>127)*4096;
            clear data;
            clear low;
            for k=1:heasig.nsig,
                y(:,k)=samples(k:heasig.group(i):size(samples,2)).';
            end;
        end
    end
elseif heasig.fmt(1)==310,
     try 
        fseek(fid, x1-1, 'bof');
        aux = fread(fid, [2 (x2-x1)], '*uint16')';
        y(:,1) = bitand( aux(:,1), uint16(2046) );
        y(:,2) = bitand( aux(:,2), uint16(2046) );
        y(:,3) = bitshift(bitand( aux(:,1), uint16(63488) ),-10) + bitshift(bitand( aux(:,2), uint16(63488) ),-5);
        y( y > 1024 ) = y( y > 1024 ) - 2048;
        fclose(fid);
    catch ME
        fclose(fid);
        rethrow(ME)
    end
    y = [];
elseif heasig.fmt(1) == 311
    try 
        fseek(fid, x1-1, 'bof');
        aux = fread(fid, (x2-x1), '*uint32')';
        y(:,1) = bitand( aux, uint16(1023) );
        y(:,2) = bitshift(bitand( aux, uint16(1047552) ), -10);
        y(:,3) = bitshift(bitand( aux, uint16(1072693248) ), -20);
        y( y > 1024 ) = y( y > 1024 ) - 2048;
        fclose(fid);
    catch ME
        fclose(fid);
        rethrow(ME)
    end
end

function checkend(fid)
checkfid = ferror(fid);
if strcmp(checkfid,'At end-of-file.')
elseif strcmp(checkfid,'Offset is bad - after end-of-file or last character written.')
    ME = MException('Getvec:OutOfBounds', ...
        'Offset is bad - after end-of-file or last character written.');
    throw(ME);
end
