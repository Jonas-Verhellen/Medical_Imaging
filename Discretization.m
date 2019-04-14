%% Second section: Defining the variables
N  = length(Data);                                      % Dimension of the array
dT = pi/N;                                              % Step
dB = dX;                                                % Step of voxels
L  = dB*N;                                              % Length of the side of the square

%% Third section: Theta, Phi, S generation
Theta = (dT/2):dT:(pi - dT/2);                          % Theta array, notice the ofset, adjusted to get N values
Phi   = Theta - pi/2;           % Phi array using Theta, notice that phi stays inside -pi/2 to pi/2, adjusted to get N values
Smax  = L/2;                                            % Maximal S as derived on the drawing
S     = (-Smax+dB/2):dB:(Smax-dB/2);                    % S array, adjusted to get N values