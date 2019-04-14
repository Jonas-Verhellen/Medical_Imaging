function [ Output, Error , chi_squared , maximum_diff , correlation ] = Conjugate_Gradient( A2D, N , Data_array , NConjGrad ,Data_2 )

Matrix = full(A2D);
Dmatrix = Matrix'*Matrix;
PCG_X1D = zeros(N*N,1);                                 % This is also the initial guess
rn = transpose(A2D)*(Data_array - A2D*PCG_X1D);         % r0 = initial residual vector
gn = rn;                                                % g_0 = r_0
d = rn'*rn;
rn_array = zeros(NConjGrad,1);
chi_squared_array =ones(NConjGrad,1);
maximum_diff_array =ones(NConjGrad,1);
correlation_array =ones(NConjGrad,1);

for i = 1:NConjGrad,
    if norm(rn) < 1e-20
        break;                                          % PCG converged successfully
    end
    alpha = rn'*rn/(gn'*Dmatrix*gn);
    PCG_X1D = PCG_X1D + alpha*gn;                       % D*g_{n-1}
    rn_array(i) = norm(rn);
    rn = rn - alpha*Dmatrix*gn;
    d_new = rn'*rn;
    beta = - d_new/d;
    gn = rn - beta*gn;
    d = d_new;
    [ chi_squared_array(i)  , maximum_diff_array(i) , correlation_array(i) ] = Image_Diff( From1Dto2D(PCG_X1D, sqrt(length(PCG_X1D))),Data_2);
end

Error = rn_array;
Output = PCG_X1D;
chi_squared  = chi_squared_array ;
maximum_diff =  maximum_diff_array;
correlation = correlation_array;
end
