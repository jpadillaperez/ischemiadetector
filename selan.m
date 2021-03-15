% Extraction type anntyp and number num annotations from anot annotator  
% function [anot]=selan(anot,type,number,l,t)
%
% Jose Garcia Moros
% email: jogarmo@posta.unizar.es
% last revision: 20 Oct 1997

function [anot]=selan(anot,type,number,l,t)


  if type=='t', auxi=find(~(anot(l).anntyp==type));  
  else auxi=find(~(anot(l).anntyp==type & anot(l).num==number));
  end

  if (~isempty(auxi))
    anot(l).anntyp(auxi)=[];
    anot(l).time(auxi)=[];
    anot(l).num(auxi)=[];
    anot(l).subtyp(auxi)=[];
    anot(l).chan(auxi)=[];
    %anot(l).aux(auxi,:)=[];
  end

if nargin==5
  auxi=find(anot(l).time<t(1) | anot(l).time>t(2));   
  if (~isempty(auxi))
    anot(l).anntyp(auxi)=[];
    anot(l).time(auxi)=[];
    anot(l).num(auxi)=[];
    anot(l).subtyp(auxi)=[];
    anot(l).chan(auxi)=[];
    %anot(l).aux(auxi,:)=[];
  end
end
