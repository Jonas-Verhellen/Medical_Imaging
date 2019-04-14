%% FIGURES

X_coord = -L/2+dB/2:dB:L/2-dB/2;
Y_coord = X_coord;

%
% The SINOJOS  for testing
FF = figure;

set(FF,'name','Testing of A: reconstructing the sinogram','numbertitle','off')
subplot(3,1,1);
title('Given sinogram for Joseph')
SINOJOS = From1Dto2D(DataInput('./01-Data/01-32x32/01-Thorax/01-Ideal/SinoJos111','Sinogram'),N);
PLOT( SINOJOS, Phi  , S , 'Sinogram' ,[0 120]);

% The recalculated sinogram 
subplot(3,1,2);
title('Reconstructed sinogram')
TEST2D = From1Dto2D( TEST, N );
PLOT(TEST2D ,Phi  , S , 'Sinogram' ,[0,120]);

% The  sinogram differences
subplot(3,1,3);
title('Difference in sinograms')
PLOT(TEST2D - SINOJOS ,Phi  , S , 'Sinogram' );

FF = figure;
set(FF,'name','The images','numbertitle','off')
% The output image from Landfeber
subplot(2,2,1);
title('Landweber image')
Out_Landweber_2D = From1Dto2D( Out_Landweber, N );
PLOT(Out_Landweber_2D , X_coord , Y_coord , 'Image');

% The output image from CG
subplot(2,2,2);
title('Conjugate gradient image')
Out_Conjugate_Gradient_2D = From1Dto2D( Out_Conjugate_Gradient, N );
PLOT(Out_Conjugate_Gradient_2D , X_coord , Y_coord , 'Image');

% The output image from ML_EM
subplot(2,2,3);
title('Maximum likelihood image')
Out_ML_EM_2D  = From1Dto2D( Out_ML_EM, N );
PLOT(Out_ML_EM_2D , X_coord , Y_coord , 'Image');

% The desired output
subplot(2,2,4);
title('Perfect image')
Goal = Data_2;
PLOT( Goal,  X_coord , Y_coord , 'Image' );
