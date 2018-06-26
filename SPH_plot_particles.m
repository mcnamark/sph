%% Smoothed Particle Hydrodynamics Code
% -------------------------------------------------------------------------
%  Developed by Kevin McNamara
%  McMaster University - Civil Engineering
% -------------------------------------------------------------------------
%  SPH_plot_particles.m
%  Plot the particles at a given time in the simulation.
% -------------------------------------------------------------------------

% Time index (add 1 since matlab doesn't do 0 index so t = 0 is actually 1)
t_id = tplot/SPHsim.dto + 1;

figure;
% Plot boundary particles.
plot(particles{t_id}(bindex,1),particles{t_id}(bindex,2),'k.')
hold on
% Plot fluid particles.
plot(particles{t_id}(findex,1),particles{t_id}(findex,2),'b.')
xlabel('x (m)'); ylabel('y (m)')
title(sprintf('Particle Position at time = %.4f seconds',tplot))
axis equal
% xlim([SPHsim.x.min,SPHsim.x.max])
% ylim([SPHsim.y.min,SPHsim.y.max])