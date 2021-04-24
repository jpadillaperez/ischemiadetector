function [ filtered ] = filt_lowpass(sinal,fm,fc)

if nargin < 1
    disp('Not enought input parameters, please type "help filt_lowpass" for more information.');
    return
elseif nargin < 2
    fm = 1000;
    fc = 45;
elseif nargin < 3
    fc = 45;
elseif nargin > 3
    disp('Too many input parameters, please type "help filt_lowpass" for more information.');
    return
end

% if size(sinal,1) < size(sinal,2)
%     sinal = sinal.';
% end
%-------------------------------------------------------------------
%   Low Pass Filtered 35 Hz: fm = sampling, fc = Cut freq
%--------------------------------------------------------------

[B,A] = butter(4,fc/(fm/2));
filtered = filtfilt(B,A,sinal);
