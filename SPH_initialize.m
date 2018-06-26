%% Smoothed Particle Hydrodynamics Code
% -------------------------------------------------------------------------
%  Developed by Kevin McNamara
%  McMaster University - Civil Engineering
% -------------------------------------------------------------------------
%  SPH_initialize.m
%  Initializes the program.
% -------------------------------------------------------------------------

%% Load input values.
SPH_input;

%% Initialize particles.
SPH_init_particles;

%% Plot initial particle locations.
tplot = 0; SPH_plot_particles;