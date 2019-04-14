function [ Data, Data_2,  Data_array, Data_array_2, dX, dY, dP, dS ] = INPUT_options( name, size )

if strcmp( name, 'Thorax') && size == 32 ,
    [Data,dP,dS]   = DataInput('./01-Data/01-32x32/01-Thorax/01-Ideal/SinoSim111','Sinogram');  %N x N matrix ( N = 32 )
    [Data_2,dX,dY] = DataInput('./01-Data/01-32x32/01-Thorax/Image11','Image');                 %N x N matrix ( N = 32 )
elseif strcmp( name , 'Point') && size == 32 ,
    [Data,dP,dS]   = DataInput('./01-Data/01-32x32/02-PuntBron/01-Ideal/SinoSim121','Sinogram');  %N x N matrix ( N = 32 )
    [Data_2,dX,dY] = DataInput('./01-Data/01-32x32/02-PuntBron/Image12','Image');                 %N x N matrix ( N = 32 )
elseif strcmp(name, 'Thorax')  && size == 64 ,
    [Data,dP,dS]   = DataInput('./01-Data/02-64x64/01-Thorax/01-Ideal/SinoSim211','Sinogram');  %N x N matrix ( N = 64 )
    [Data_2,dX,dY] = DataInput('./01-Data/02-64x64/01-Thorax/Image21','Image');                 %N x N matrix ( N = 64 )
elseif strcmp( name , 'Point') && size == 64 ,
    error('Error. This file does not exist in 64 x 64 format.')
    
else
    error('Error, the file you requested is not available. We are sorry for the inconvience.')
end

Data_array   = From2Dto1D(Data);    %N² x 1 - The incomming data (sinogram) in 1D
Data_array_2 = From2Dto1D(Data_2);  %N² x 1 - The incomming data (sinogram) in 1D
end

