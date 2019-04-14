%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% -> Read data from a Image- or Sinogram-file into a matrix
% INPUT
% - FileName = string, 'Image' or 'Sinogram'
%            = Name of the file you want to read. The file:
%               * Header:   Has a header (extra info) of 512 bytes.
%               * Type:     Binary, with 'float, Little-Endian 32 bit' numbers
%               * Location: Must be located inside the folder '01-Data',
%                           or one of its subfolders
% - Type = 'Image' or 'Sinogram'
% OUTPUT
% - f2D = NrXP x NrYS
%       = The read data, inside a matrix
% - dXP, dYS = Sizes of the:
%               * pixels:           (x,y) [mm]
%               * sampling steos:   s [mm], phi [rad]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ f2D, dXP,dYS ] = DataInput( FileName, Type )



%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OPEN the file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make the data inside the folder '01-Data' of your current path,
% and all its subfolder available
addpath( genpath('./01-Data') )
% Open the file
% - 'r': open to read
% - 'l': Machine format = Little-Endian ordering
fileID = fopen( FileName, 'r', 'l' );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%% Het bestand LEZEN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 'float': The data are floating point numbers (of 32 bit = 4 byte)
f2D = fread( fileID, 'float' ); % = ( NrXP*NrYS + 128 ) x 1
% Number of floating point numbers inside the header:
% = 512 bytes / ( 4 bytes / floating point number ) = 128 floating point numbers
OffSet = 128;
% Read some data from the header:
%   - Image: Number and sizes of the Image-pixels widths
%   - Sinogram: Number and Sinogram-sample steps
switch Type
    case 'Image'
        % Number of pixels        
        NrXP = f2D( 11 );   % NrX
        NrYS = f2D( 12 );   % NrY
        % Sizes of the pixels, [mm]
        dXP = f2D( 14 );    % dX
        dYS = f2D( 15 );    % dY
    case 'Sinogram'
        % Number of samples
        NrXP = f2D( 39 );   % NrP
        NrYS = f2D( 37 );   % NrS       
        % Sample steps
        dXP = pi / NrXP;    % dP, [rad]
        dYS = f2D( 40 );    % dS, [mm]
    otherwise
        error( 'Choose as Type "Image" or "Sinogram".' )
end
% The data is grouped as follows:
%     [  x(1)[y(1)...y(end)] ... x(end)[y(1)...y(end)]  ]'
% or: [  p(1)[s(1)...s(end)] ... p(end)[s(1)...s(end)]  ]'
% This means that, after you used 'reshape', you need to transpose the matrix    
f2D = reshape(  f2D( (OffSet+1):end ), NrYS,NrXP  )';   % = NrXP x NrYS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end