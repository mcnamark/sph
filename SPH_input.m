%% Smoothed Particle Hydrodynamics Code
% -------------------------------------------------------------------------
%  Developed by Kevin McNamara
%  McMaster University - Civil Engineering
% -------------------------------------------------------------------------
%  SPH_input.m
%  Define input values - to be converted to read in text file later.
% -------------------------------------------------------------------------

%% Define simulation time information.
SPHsim.time = 1; % Simulation time (seconds).
SPHsim.dto = 0.02; % Simulation output time step (seconds).

%% Define simulation spatial information.
SPHsim.dims = 2; % 1 = 1D, 2 = 2D, 3 = 3D
SPHsim.dp = 0.001; % Initial particle spacing (m)

% Domain boundaries (m)
SPHsim.x.min = -0.1/2;
SPHsim.x.max = 0.1/2;
SPHsim.y.min = 0;
SPHsim.y.max = 0.016;
SPHsim.z.min = 0;
SPHsim.z.max = 0;
SPHsim.L = SPHsim.x.max - SPHsim.x.min;
SPHsim.H = SPHsim.y.max - SPHsim.y.min;
SPHsim.W = SPHsim.z.max - SPHsim.z.min;

% Initial fluid position information (m)
SPHsim.fx.min = SPHsim.x.min + SPHsim.dp;
SPHsim.fx.max = SPHsim.x.max - SPHsim.dp;
SPHsim.fy.min = SPHsim.y.min + SPHsim.dp;
SPHsim.fy.max = 0.0144; % Fill level
SPHsim.fz.min = 0;
SPHsim.fz.max = 0;

% Screen information
SPHsim.ns = 2; % Number of screens
SPHsim.sc(1).y = -0.1*SPHsim.L; % X coordinate of screen (m)
SPHsim.sc(1).slatHeight = 5/1000; % Slat height (m)
SPHsim.sc(1).slatSpacing = 7/1000; % Slat spacing (m)

SPHsim.sc(2).y =  0.1*SPHsim.L; % X coordinate of screen (m)
SPHsim.sc(2).slatHeight = 5/1000; % Slat height (m)
SPHsim.sc(2).slatSpacing = 7/1000; % Slat spacing (m)

%% Define excitation parameters.
excitation.type = 'Sinusoidal'; % Excitation type
excitation.duration = SPHsim.time; % Excitation duration
excitation.freq_ratio = 1; % Excitation frequency ratio = w_exite / w_nat