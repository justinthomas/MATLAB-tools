f1=.1 ; f2=2.5; n=10; % 20 frequencies from .1Hz to 2Hz

range = pi/2+pi/5;
mean = range/2;

dt = 1/1000;

transient_periods=5; measure_periods=5; % Keep signal constant for 10 cycles for each freq

M=linspace(1,1,n); % This is the magnitude of the signal for each frequency

[u_ref f t_end ind_end] = mod_chirp_gen_ref(dt, f1, f2, n, transient_periods, measure_periods, M) ;

t_vec = dt*(0:length(u_ref)-1);

% Shift to mean and scale accordingly
u_ref = u_ref * range / 2;
u_ref = u_ref + mean;

figure ; plot(t_vec,u_ref) ; xlabel('time (s)') ;