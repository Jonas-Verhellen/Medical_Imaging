%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Plot a part of the 4D system matrix. To debug 'A4D'
% INPUT
% - A4D = (IP x IS) x (JB x JB)
%       = De 4D system matrix
% - T = 1 x IT
%     = The angular samples
% - S = 1 x IS
%     = The radial samples
% OUTPUT
% - Plot of a part of the 4D system matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PlotA4D( A4D,T,S )


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[IP,IS,JB,~] = size(A4D);
P = T - pi/2;
dS = S(2) - S(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for iP = 1:4    % A plot for 4 different phi
    for iS = 1:4    % A plot voor 4 different s
        subplot( 4,4, (iP-1)*4 + iS );
        % Take an angular and radial sample
        iip = ( 2*iP - 1)*IP/8;
        iis = ( 2*iS - 1)*IS/8;
        % Plot with: 'x' horizontal to the right and 'y' vertical up
        % => Take the transpose
        a = reshape( A4D(iip,iis,:,:), JB,JB )';
        % Are all elements zero? => Skip this instance of the for-loop
        if all(~a)
            continue
        end
        contourf( a );
        axis square;
        xlabel('x'); ylabel('y')
        title( [ '\phi = ', num2str(P(iip)*2*IP/pi), '\pi/', num2str(2*IP), ...
                 ',  s = ', num2str(S(iis)*2/dS), 'dS/2' ] )
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end