function y = leadcalct(x,type)

%Function
% leadcalct
% 
%Purpose
% various lead calculations for time measurements
%
%Synopsis
% y = leadcalct(x,type)
% y = leadcalct(x)
%
%Description
% The function calculates extremity/limb leads time measurements for the
% standard 12-lead ECG or synthesized VCG leads based on either an (8xn) 
% or (9xn) matrix containing V1,V2,V3,V4,V5,V6,I,II and, eventually, III.
%
% The desired lead configuration is specified by the character string 'type'.
% The string 'extr' produces the missing extremity/limb leads and the result-
% ing output matrix contains the leads V1,V2,V3,V4,V5,V6,aVL,I,-aVR,II,aVF,III
% (stored according to the panoramic display format).
%
% The string 'synt' results in a synthesized VCG (leads X, Y and Z) using
% the inverse Dower matrix for lead synthesis.
%
% The default string is 'extr'.

% Copyright (c), Leif Sornmo %----------------------------------------------------------------------------


%----------------------------------------------------------------------------
if size(x,1) > size(x,2)
	disp('WARNING: input ECG data is transposed')
	x = x';
end
no_leads = size(x,1);
if no_leads < 8 | no_leads > 9
	error('only 8 or 9 leads accepted')
end
if nargin == 1
	type = 'extr';
end
%----------------------------------------------------------------------------


%----------------------------------------------------------------------------
if strcmp(type,'extr')
% extremity leads
	y = zeros(12,size(x,2));
	y(1:6,:) = x(1:6,:);				% V1, V2, V3, V4, V5, V6
	y(7,:) = ( 2 * x(7,:) + x(8,:) ) / 3;		% aVL = I-II*0.5
	y(8,:) = x(7,:);					% I
	y(9,:) = (x(7,:)+x(8,:))/2;			% -aVR = (I+II) / 2 
	y(10,:) = x(8,:);					% II
	y(11,:) = (2 * x(8,:) + x(7,:) ) / 3  ;	% aVF = II-I/2
	if no_leads == 8
		y(12,:) = (x(8,:) + x(7,:))/2;		% III = II-I
	else
		y(12,:) = x(9,:);
	end
%----------------------------------------------------------------------------
	

%----------------------------------------------------------------------------
% synthesised VCG with inverse Dower matrix
elseif strcmp(type,'synt')
	t = [-.172 -.074 .122 .231 .239 .194 .156  -.010;...
		  .057 -.019 -.106 -.022 .041 .048 -.227 .887;...
	     -.229 -.310 -.246 -.063 .055 .108 .022 .102]; 
	y = t * x(1:8,:);
else
	error('unknown type')
end 
%----------------------------------------------------------------------------
