function [ unevenly_out, unevenly_out_t, med_y, eta_y, evenly, evenly_t ] = outlier_correction_by_std( unevenly_in, unevenly_in_t, Ne, C, evenly_flag, evenly_Tend, evenly_fs, plotflag )
%OUTLIER_CORRECTION_BY_STD   Outlier correction algorithm based on "A Robust Method for
%                            ECG-Based Estimation of the Respiratory Frequency During
%                            Stress Testing" by R. Bailón et al. Every samples outside
%                            interval [med_y-eta_y, med_y+eta_y] are removed, where
%                            "med_y" is the median of previous "Ne" samples, and "eta_y"
%                            is the STD of those "Ne" samples times a constant "C".
%
% Created by Jesús Lázaro <jlazarop@unizar.es> in 2011
%--------
%   Sintax: [ unevenly_out, unevenly_out_t, mean_y, eta_y, evenly ] = outlier_correction_by_std( unevenly_in, unevenly_in_t, Ne, C, evenly_flag, evenly_Tend, evenly_fs, plotflag )
%   In:   unevenly_in = unevenly sampled signal that may contain outliers
%         unevenly_in_t = time vector for "unevenly_in" (seconds)
%         Ne = number of previous samples which are used in "mean_y" and "eta_y"
%         C = constant which multiplies STD to obtain "eta_y"
%         evenly_flag = if ~=0, an evenly sampled version of "unevenly_out" is generated
%         evenly_Tend = time instant when evenly sampled signal ends (seconds)
%         evenly_fs = sampling rate of evenly sampled signal (Hz)
%         plotflag = if 1 -> function shows some figures [Default: 0]
%         
%
%   Out:  unevenly_out = unevenly sampled signal without outliers
%         unevenly_out_t = time vector for "unevenly_out" (seconds)
%         med_y = median of previous "Ne" samples
%         eta_y = STD of previous "Ne" samples
%         evenly = evenly sampled version of "unevenly_out"

    if nargin<2
        error('Not enough input arguments');
    end
    if nargin<3
        Ne = 50;
    end
    if nargin<4
        C = 5;
    end
    if nargin<5
        evenly_flag = 0;
    end
    if nargin<6
        plotflag = 0;
    end
    if (evenly_flag~=0) && (nargin<7)
        error('You must provide "evenly_Tend" and "evenly_fs" since "evenly_flag" is not set to "0"');
    end
    
    
    %% Compute variance:
    eta_y = nan(size(unevenly_in)); %eta_y will contain the threshold
    med_y = eta_y;
    for kk=1:length(unevenly_in)
        if kk>=Ne %Ne estimates are available
            int_ini = kk-Ne+1;
            int_end = kk;
        else %Less than Ne estimates are available
            int_ini = 1;
            int_end = kk;
        end
        
        eta_y(kk) = C*sqrt(var(unevenly_in(int_ini:int_end)));
        med_y(kk) = median(unevenly_in(int_ini:int_end));
    end
    
    
    %% Set outliers to NaN:
    lim_sup = med_y + eta_y;
    lim_inf = med_y - eta_y;
    
    unevenly_out_t = unevenly_in_t;
    unevenly_out = unevenly_in;
    unevenly_out(unevenly_out>lim_sup |unevenly_out<lim_inf) = nan;
    
    
    %% Linear interpolation for NaN samples:
    unevenly_out = interp1(unevenly_out_t(~isnan(unevenly_out)), unevenly_out(~isnan(unevenly_out)), unevenly_out_t, 'linear');
    
    %% Splines interpolation:
    if evenly_flag~=0
        evenly_t = 0:1/evenly_fs:evenly_Tend;
        evenly = spline(unevenly_out_t, unevenly_out, evenly_t);
%         evenly = spline(unevenly_out_t, unevenly_out, evenly_t(evenly_t>=unevenly_out_t(1) & evenly_t<=unevenly_out_t(end)));
%         evenly = [nan(1, find(evenly_t<unevenly_out_t(1), 1, 'last')), evenly];
    else
        evenly = [];
    end
    
    
    %% Figures:
    if plotflag==1
        figure;
        subplot(2,1,1); hold on;
        plot(unevenly_in_t, unevenly_in, 'r*');
        plot(unevenly_in_t, lim_sup, 'k');
        plot(unevenly_in_t, lim_inf, 'k');
        title('Input'); xlabel('Time (s)');
        subplot(2,1,2); hold on;
        if evenly_flag==1
            plot(evenly_t(1:length(evenly)), evenly, 'b');
        end
        plot(unevenly_out_t, unevenly_out, 'r*');
        plot(unevenly_in_t, lim_sup, 'k');
        plot(unevenly_in_t, lim_inf, 'k');
        title('Output'); xlabel('Time (s)');
    end
    
end