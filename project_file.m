%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PROJECT COMPUTATIONAL PHYSICS 2015-2016
% Paul Coppin  (PC) 
% Marine De Clerck (MDC)
% Jonas Verhellen (JV)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PREAMBLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. CLEAN UP
clear all; 
close all;
format long;

%% 2. LOCAL M-FILE
if(~isdeployed)
  cd(fileparts(which(mfilename))); 
end

%% 3. INPUT
Start_Variables;
[ Data, Data_2,  Data_array, Data_array_2, dX, dY, dP, dS ] = INPUT_options( 'Thorax', 32 );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ALGORITHM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4. DESCRETE VARIABLES
Discretization;                                         % Calling the appropriate M-file

%% 5. A4D
A4DBuilder;                                             % Joseph + Symmetry, returns A4D
A4DDebug;                                               

%% 6. A2D

A2D = From4Dto2D( A4D );                                % The 2D matrix consisting of the components of A4D
Tim   = From2Dto1D(DataInput('./01-Data/01-32x32/01-Thorax/Image11','Image'));
TEST = A2D*Tim;                                         % TEST should resemble the sinogram

%% 7. INVERSION OF A2D
% Solve the A(2D) x(1D) = b(1D), with A = A2D, x the sought after image and b = Data_array. 

% Landweber methode  
[Out_Landweber,Error_Landweber] = Landweber(A2D,Data_array,ErrorLandweber,NLandweber,CutofzeroLandweber,OptimalStepLandweber);

% Conjugate_Gradient
[Out_Conjugate_Gradient,Error_Conjugate_Gradient,chi_squared_Conjugate_Gradient,maximum_diff_Conjugate_Gradient, correlation_Conjugate_Gradient] = Conjugate_Gradient( A2D, N , Data_array , NConjGrad ,Data_2  );

% ML methode
[Out_ML_EM,Error_ML_EM,chi_squared_ML_EM,maximum_diff_ML_EM, correlation_ML_EM]  = ML_EM( A2D ,Data_array  ,NML ,Data_2 );

%% 8. VISUALS

%Figures
DisplayFigure;                                          % Calling the appropriate M-file

% Plots
DisplayPlots;                                           % Calling the appropriate M-file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%