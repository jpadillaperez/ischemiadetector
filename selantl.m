% Extraction type anntyp and number num annotations from anot annotator  
% function [anot]=selan(anot,type,number,t)
%
% Jose Garcia Moros
% email: jogarmo@posta.unizar.es
% last revision: 20 Oct 1997

function [anot]=selan(anot,type,number,t)
no_leads=size(anot,2);

for l=1:no_leads
  if type=='t', auxi=find(~(anot(l).anntyp==type));  
  else auxi=find(~(anot(l).anntyp==type & anot(l).num==number)); %%especificamente no quiere hacer lo que haga selantl a los que tengan type N y num 0 que son todos mi caso
  end

  if (~isempty(auxi))
    anot(l).anntyp(auxi)=[];
    anot(l).time(auxi)=[];
    anot(l).num(auxi)=[];
    anot(l).subtyp(auxi)=[];
    anot(l).chan(auxi)=[];
    %anot(l).aux(auxi,:)=[];
  end
end

if nargin==4
 for l=1:no_leads
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
end
