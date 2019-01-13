
switch choice_sim
    case 'triangle'
        name_extension = 'eure8_try1_2s_t' ; %triangle - nx=32 - ny=32 - nt=246
        a0 = -6; %laser pulse phase or arbitrary start
        sigmal = 0.06; %laser illumination widths at the entering surface
        lm = 0.00014;    % mean free path of scattering
        la = 0.0714;     % mean free path of absorption
        pl = [0.05,0.025,0.025];
        s = 5*10^8; % step size
        lambda1 = 3*1e-12; % tv norm regularisation coefficient.
        lambda2 = 2*1e-10; % l1 norm regularisation coefficient. 
        mc = 0; % threshold for masking
        niter = 1000; % number of iterations.
        display_iterations = 100; % display current state interval.
    case 'A'
        name_extension = 'eure3_try1_2s_A' ; %A        - nx=32 - ny=32 - nt=246
        a0 = -9; %laser pulse phase or arbitrary start
        sigmal = 0.06; %laser illumination widths at the entering surface
        lm = 0.00014;    % mean free path of scattering
        la = 0.0714;     % mean free path of absorption
        pl = [0.05,0.025,0.025];
        s = 5*10^8; % step size
        lambda1 = 3*1e-12; % tv norm regularisation coefficient.
        lambda2 = 2*1e-10; % l1 norm regularisation coefficient. 
        mc = 0.45;% threshold for masking
        niter = 2000; % number of iterations.
        display_iterations = 100; % display current state interval.
    case 'X'
        name_extension = 'eure4_try1_2s_X' ; %X        - nx=32 - ny=32 - nt=246
        a0 = -17; %laser pulse phase or arbitrary start
        sigmal = 0.06; %laser illumination widths at the entering surface
        lm = 0.00014;    % mean free path of scattering
        la = 0.0714;     % mean free path of absorption
        pl = [0.05,0.025,0.025];
        s = 5*10^8; % step size
        lambda1 = 3*1e-12; % tv norm regularisation coefficient.
        lambda2 = 2*1e-10; % l1 norm regularisation coefficient. 
        mc = 0.3; % threshold for masking
        niter = 1000; % number of iterations.
        display_iterations = 100; % display current state interval.
    case 'res_small_5mm'
        name_extension = 'resolution_measurements_28x28_12' ; % double slit        - nx=32 - ny=32 - nt=246
        a0 = 6; %laser pulse phase or arbitrary start
        sigmal = 0.06; %laser illumination widths at the entering surface
        lm = 0.00014;    % mean free path of scattering
        la = 0.0714;     % mean free path of absorption
        pl = [0.05,0.021,0.0184];
        s = 5*10^8; % step size
        lambda1 = 1*1e-12; % tv norm regularisation coefficient.
        lambda2 = 2.5*1e-10; % l1 norm regularisation coefficient.  
        mc = 0.3; % threshold for masking
        niter = 5000; % number of iterations.
        display_iterations = 1000; % display current state interval.
      case 'res_small_2mm'
        name_extension = 'resolution_measurements_2mm_28x28_4' ; % double slit        - nx=32 - ny=32 - nt=246 
        a0 = 6; %laser pulse phase or arbitrary start
        sigmal = 0.06; %laser illumination widths at the entering surface
        lm = 0.00014;    % mean free path of scattering
        la = 0.0714;     % mean free path of absorption
        pl = [0.05,0.021,0.0184];
        s = 5*10^8; % step size
        lambda1 = 0.5*1e-14; % tv norm regularisation coefficient.
        lambda2 = 2.55*1e-10; % l1 norm regularisation coefficient.  
        mc = 0.3; % threshold for masking
        niter = 10000; % number of iterations.
        display_iterations = 1000; % display current state interval.
      case 'res_small_1mm'
        name_extension = 'resolution_measurements_1mm_28x28_12' ; % double slit        - nx=32 - ny=32 - nt=246
        a0 = 6; %laser pulse phase or arbitrary start
        sigmal = 0.01; %laser illumination widths at the entering surface
        lm = 0.00014;    % mean free path of scattering
        la = 0.0714;     % mean free path of absorption
        pl = [0.05,0.021,0.0184];
        s = 5*10^8; % step size
        lambda1 = 1*1e-12; % tv norm regularisation coefficient.
        lambda2 = 2*2.5*1e-10; % l1 norm regularisation coefficient.  
        mc = 0.3; % threshold for masking
        niter = 5000; % number of iterations.
        display_iterations = 100; % display current state interval. 
end

% Load pre-computed pixels coordinates
load(['pixels_positions_',name_extension]) ;

% Load 2D+t observations
load(['filtered_difference_',name_extension]) ;