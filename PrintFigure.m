%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Print a figure handle to a pdf-file
% INPUT
% - h = figure handle (e.g.: 'h = figure;')
% - PathFileName = Path  + FileName for the file, without extension
% - Width, Height = Width and height of the printed figure, [cm]. Optional
% OUTPUT
% none. A file 'PathFileName.pdf' is written
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PrintFigure( h, PathFileName, Width, Height )



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DEFAULTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Extension = 'pdf';
Units = 'Centimeters';
FontSize = 11;
FontWeight = 'normal';
LineWidth = 1.6;
% Defaults [cm]
if nargin < 3
    Width = 10;
end
if nargin < 4
    Height = 0.9*Width;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIZE FIGURE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Size
set( h, 'PaperUnits', Units );
set( h, 'PaperSize', [Width Height]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%% CENTER THE FIGURE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find position
PaperSize = get( h, 'PaperSize');
% Set Center
set( h, 'PaperPositionMode', 'manual');
MarginLeft   = (PaperSize(1) - Width )/2;
MarginBottom = (PaperSize(2) - Height)/2;
MyFigureSize = [ MarginLeft, MarginBottom, Width, Height];
set( h, 'PaperPosition', MyFigureSize );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SET TEXT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find Text
textobj = findall( h, 'type', 'text' );
% Set Text
set( textobj, 'fontunits', 'points');
set( textobj, 'fontsize', FontSize );
set( textobj, 'fontweight', FontWeight );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SET LINES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find Lines
lineobj = findobj( h, 'type', 'line');
% Set Lines
set( lineobj, 'linewidth', LineWidth );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%% PRINT TO FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print( h, '-dpdf', [PathFileName,'.', Extension] );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end