%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Convert a 1D column to a 2D matrix
% INPUT
% - XY1D = (NrXP*NrYS)
%        = A 2D Image or Sinogram, as a column
%                    _____
%          |          xp(1)    |
%          | ys(1)     ...     |
%          |          xp(NrXP) |
%          |          _____    |
%   XY1D = |           ...     |
%          |          _____    |
%          |          xp(1)    |
%          | ys(NrYS)   ...    |
%          |          xp(NrXP) |
%          |          _____    |
% - NrXP = Number x- or phi-samples
% OUTPUT
% - XY2D = NrXP x NrYS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function XY2D = From1Dto2D( Y1D, NrXP )


XY2D = reshape( Y1D, NrXP, [] );  % = NrXP x NrYS


end