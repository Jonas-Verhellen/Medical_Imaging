 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Convert a 2D matrix to a 1D column
% INPUT
% - X2D = JX x JY
%       = A 2D Image
% OUTPUT
% - X1D = (JX*JY) x 1
%       = The 2D Image as a column
%                   _____
%         |         x(1)    |
%         | y(1)    ...     |
%         |         x(JX)   |
%         |         _____   |
%   X1D = |         ...     |
%         |         _____   |
%         |         x(1)    |
%         | y(JY)   ...     |
%         |         x(JX)   |
%         |         _____   |
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function X1D = From2Dto1D( X2D )

X1D = X2D(:);   % = 1 x (JX*JY)

end