function [annot,rr]=remov(annot,nbr,heasig,t,rr)

% Removing of beats nbr in the annotation file
% function [annot,rr]=remov(annot,nbr,heasig,t,rr)
%
% Copyright (c), Jose Garcia Moros, Zaragoza University, Spain
% email: jogarmo@posta.unizar.es
% last revision: 28 Aug 1997
  
if (~isempty(nbr))
  annot.anntyp(nbr)=[];
  annot.time(nbr)=[];
  annot.num(nbr)=[];
  annot.subtyp(nbr)=[];
  annot.chan(nbr)=[];
  %annot.aux(nbr,:)=[];
  rr(nbr)=[];
end

aux=find(annot.time<t(1) | annot.time>(t(2)+heasig.freq) );
annot.anntyp(aux)=[];
annot.time(aux)=[];
annot.num(aux)=[];
annot.subtyp(aux)=[];
annot.chan(aux)=[];
%annot.aux(nbr,:)=[];
rr(aux)=[];
