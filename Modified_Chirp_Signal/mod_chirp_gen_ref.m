% Generates the reference signal
% f is a vector of frequencies, u_ref is the data, t_end_j is the time at the end
% of the last cycle of applying frequency f_j
% Input Params:
%  dt - Time between generated samples
%  f1 - starting frequency
%  f2 - ending frequency
%   n - No. of points in the logspace between f1 and f2
% transient_periods - No. of periods of data to wait for transients to die out
% measure_periods - No. of periods of data to measure
% Output Params:
%  u_ref - Reference data to be applied, sampled at dt
%  f - frequency vector
%  t_end - Time at the end of applying each frequency
%  (Transient_periods+measure_periods at that frequency)
%  M     - Magnitude of exitation for each frequency
% Ph - [Optional] [Default=0] Additional Phase to be added.
function [u_ref f t_end ind_end] = mod_chirp_gen_ref(dt, f1, f2, n, transient_periods, measure_periods, M, Ph)
    if(nargin==0)
        dt = 1/1000 ;
        f1=0.1 ; f2=200 ; n=50 ;
        transient_periods = 3 ;
        measure_periods = 5 ;
    end
    if(nargin<=6 || length(M)~=n) % No M supplied or incorrect
        M = ones(n,1) ;
    end
    if(nargin<=7)
        Ph=0 ;
    end
    
    f = logspace(log10(f1),log10(f2),n);

    u_ref = [] ; t_end = [] ; ind_end = [] ;

    for j=1:length(f)
        %ind = [1:(transient_periods+measure_periods) / f(j)*1000] ;
        %t = (ind-1)*1e-3 ;
        t = [0:dt:(transient_periods+measure_periods) / f(j)] ;
        y_ = M(j)*sin(2*pi*f(j)*t + Ph) ;
        u_ref = [u_ref y_] ;
        if(length(t_end)==0)
            t_end = t(end) ;
            ind_end = length(t) ;
        else
            t_end = [t_end ; t_end(end)+t(end)] ;
            ind_end = [ind_end ; ind_end(end)+length(t)] ;
        end
end