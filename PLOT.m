%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Plot an Image or Sinogram
% INPUT
% - f = NrXP x NrYS
%     = Matrix to be plotted
% - xp = 1 x NrXP
%      = x- of phi-coordinates
% - ys = 1 x NrYS
%      = y- of s-coordinates
% - Type = 'Image' of 'Sinogram'
% - ColorLim = [ min, max ]
%            = Limits of the colorbar, optional.
%              Handy to match the color scales of several plots
% OUTPUT
% - Plot:
%   * Image:    'x' horizontal to the right and 'y' vertical up
%   * Sinogram: 's' horizontal to the right and 'p' vertical up
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PLOT( f, xp,ys, Type, ColorLim )


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch Type
    case 'Image'
        % 'x' horizontal to the right and 'y' vertical up
        % => transpose needed
        pcolor( xp,ys, f' );  
        xlabel('x'); ylabel('y');
    case 'Sinogram'
        % f(p,s): 's' horizontal to the right and 'p' vertical up
        % => NO transpose needed
        pcolor( ys,xp, f );
        xlabel('s'); ylabel('\theta');        
    otherwise
        error( 'Choose as Type "Image" or "Sinogram".' )
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% FINISHING TOUCH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axis square;    % Depict a square image
shading flat;   % Plot without grid, nor interpolation
colorbar;       % Show the color bar
if ( nargin == 5 )      % Were there color limits provided? If so:
    caxis( ColorLim );  % Provide the limits to scale the colors
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end