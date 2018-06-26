%% Smoothed Particle Hydrodynamics Code
% -------------------------------------------------------------------------
%  Developed by Kevin McNamara
%  McMaster University - Civil Engineering
% -------------------------------------------------------------------------
%  SPH_init_particles.m
%  Initialize particles and their locations.
% -------------------------------------------------------------------------

%% Calculate number of particles of each type.
max_npx = SPHsim.L / SPHsim.dp;
max_npy = SPHsim.H / SPHsim.dp;
max_npz = SPHsim.W / SPHsim.dp;

% Number of boundary particles.
if SPHsim.dims == 1
    % 1D simulation
    nbp = 2;
elseif SPHsim.dims == 2
    % 2D simulation 
    nbp = 2*max_npx + 2*max_npy;
else
    % 3D Simulation
    nbp = 4*max_npx + 4*max_npy + 4*max_npz;
end

% Number of fluid particles.
if SPHsim.dims == 1
    % 1D simulation
    nfp = (SPHsim.fx.max - SPHsim.fx.min) / SPHsim.dp;
elseif SPHsim.dims == 2
    % 2D simulation
    nfp = (SPHsim.fx.max - SPHsim.fx.min) / SPHsim.dp * (SPHsim.fy.max - SPHsim.fy.min) / SPHsim.dp;
else
    % 3D Simulation
    nfp = (SPHsim.fx.max - SPHsim.fx.min) / SPHsim.dp * (SPHsim.fy.max - SPHsim.fy.min) / SPHsim.dp * (SPHsim.fz.max - SPHsim.fz.min) / SPHsim.dp;
end
nfp = int64(nfp);

% Number of screen particles
% !!!!!!!! ADD THIS IN LATER
nsp = 1;

% Total number of particles.
np = nbp + nfp + nsp;

%% Create particles.
%  Pre-allocate arrays for particle locations.
particles = cell(1,1);
particles{1} = zeros(np,4);

%  Create boundary particles
% particles{time_index}(:,4) = [x, y, z, type (0 = boundary, 1 = fluid, 2 = screen)
% Bottom wall
ct = 1;
y = SPHsim.y.min;
z = 0;
for x = SPHsim.x.min:SPHsim.dp:SPHsim.x.max
   particles{1}(ct,:) = [x,y,z,0];
   ct = ct + 1;
end
% Top wall
y = SPHsim.y.max;
z = 0;
for x = SPHsim.x.min:SPHsim.dp:SPHsim.x.max
   particles{1}(ct,:) = [x,y,z,0];
   ct = ct + 1;
end
% Left wall
x = SPHsim.x.min;
z = 0;
for y = SPHsim.y.min+SPHsim.dp:SPHsim.dp:SPHsim.y.max-SPHsim.dp
   particles{1}(ct,:) = [x,y,z,0];
   ct = ct + 1;
end
% Right wall
x = SPHsim.x.max;
z = 0;
for y = SPHsim.y.min+SPHsim.dp:SPHsim.dp:SPHsim.y.max-SPHsim.dp
   particles{1}(ct,:) = [x,y,z,0];
   ct = ct + 1;
end
bpimax = ct - 1; % maximum index of boundary particle

%  Create fluid particles.
z = 0;
for x = SPHsim.fx.min:SPHsim.dp:SPHsim.fx.max
    for y = SPHsim.fy.min:SPHsim.dp:SPHsim.fy.max
       particles{1}(ct,:) = [x,y,z,1];
       ct = ct + 1;
    end
end
fpimax = ct - 1; % maximum index of fluid particles.

for i = 1:nsp
    
end

%% Create a copy of initial particle locations for later use.
initial_particles = particles;

%% Create indices to be used later to specify which portions of particle
%  cell array are boundary or fluid.
bindex = 1:bpimax;
findex = bpimax+1:fpimax;