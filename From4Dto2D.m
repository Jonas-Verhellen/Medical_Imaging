%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Convert the 4D system matrix '(phi,s, x,y)' (of a 2D projection)
%    to a 2D system matrix '( (phi,s), (x,y) )'
% INPUT
% - A4D = IP x IS x JX x JY
%       = A 4D system matrix (of a 2D projection)
% OUTPUT
% - A2D = (IP*IS) x (JX*JY), type 'sparse'
%       = The real 2D system matrix (of a 2D projection)
%           * Columns: Positions (x,y)
%           * Rows:    LOR(phi,s)
%
%       |       _____           y(1)           ...         y(JY)          |
%       |       p(1)    [ x(1), ... , x(JX) ]  ...  [ x(1), ... , x(JX) ] |
%       |                                                                 |
%       | s(1)   ...                                                      |
%       |                                                                 |
%       |       p(IP)                                                     |
%       |       _____                                                     |
%       |                                                                 |
% A2D = |  ...   ...                                                      |
%       |                                                                 |
%       |       _____                                                     |
%       |       p(1)                                                      |
%       |                                                                 |
%       | s(IS)  ...                                                      |
%       |                                                                 |
%       |       p(IP)                                                     |
%       |       _____                                                     |
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function A2D = From4Dto2D( A4D )


[ IP,IS, JX,JY ] = size( A4D );
A2D = zeros( (IP*IS), (JX*JY) );

for iS = 1:IS
    for jY = 1:JY
        A2D(  ((iS-1)*IP+1):(iS*IP) , ((jY-1)*JX+1):(jY*JX)  ) ...
            = A4D( :,iS,:,jY );
    end
end

% Convert to 'sparse'. This will accelerate the matrix operations
A2D = sparse(A2D);

% Show where 'A2D' has NO zero entries
%figure; spy(A2D);

end