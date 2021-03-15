% opensig.m  function for opening signal files from header
%   it creates a vector of pointers to signal files in header
%
% function [fid]=opensig(dirsig,heasig);
%
% Copyright (c), Salvador Olmos, Zaragoza University, Spain
% e-mail: olmos@posta.unizar.es


function [fid]=opensig(dirsig,heasig);

fid=zeros(size(heasig.fname(1,:),1));
i=1;
while i<=heasig.nsig, %%EL CONTADOR ERA I PERO ENTRABA EN BUCLE
   if strcmp(heasig.fname(i,:),'-'),
	fid(i)=0;
   else
	fid(i)=fopen([dirsig heasig.fname(i,:)],'rb');
   end
   i=i+1;
   %i=i+heasig.group(i);
end
