function [ Output, Error ,  chi_squared , maximum_diff , correlation] = ML_EM( A2D , Data_array , NML ,Data_2 )

%normale verdeling !!!
Matrix = full(A2D);

sizeA = size(Matrix);
Out_ML_EM = ones(sizeA(2),1);
denominator_ML = zeros(1,sizeA(2));
rn =  transpose(A2D)*(Data_array - A2D*Out_ML_EM);
rn_array = ones(NML,1);
chi_squared_array =ones(NML,1);
maximum_diff_array =ones(NML,1);
correlation_array =ones(NML,1);
for j=1:sizeA(2),
    denominator_ML(j) = sum(Matrix(:,j));
end

for i=1:NML,
    average_y = Matrix*Out_ML_EM;
    y_normalised = Data_array./average_y;
    nominator_ML = y_normalised'*Matrix;
    factor_ML = nominator_ML./denominator_ML;
    Out_ML_EM = Out_ML_EM.*factor_ML';
    rn_array(i) = norm(rn);
    rn =  transpose(A2D)*(Data_array - Matrix*Out_ML_EM);
    [ chi_squared_array(i)  , maximum_diff_array(i) , correlation_array(i) ] = Image_Diff( From1Dto2D(Out_ML_EM, sqrt(length(Out_ML_EM))),Data_2);
end

Output = Out_ML_EM;
Error = rn_array;
chi_squared  = chi_squared_array ;
maximum_diff =  maximum_diff_array;
correlation = correlation_array;
end

