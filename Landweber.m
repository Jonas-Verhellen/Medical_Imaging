function [ Output, Error ] = Landweber( A,y,error,Numberofsteps,cutofzero,OptimalStep ) %misschien optie om te stoppen bij norm(rj)<eits.

Matrix        = full(A);                  % spare to full
Out_Landweber = zeros(length(A),1);
Dmatrix       = transpose(Matrix)*Matrix;
rj_array = zeros(Numberofsteps,1);
sigmas_D = eig(Dmatrix);
sigma_r  = max(sigmas_D);
counter  = 0;
sigmas_D_pos = ones(length(sigmas_D),1)*sigma_r; % to be sure that the non-filled components won't be smaller than the smallest eigenvalue
for i = 1:length(sigmas_D) % we want to determine the smallest non-zero eigenvalue -> we create a new vector with only the non-zero eigenvalues
    if sigmas_D(i) ~= 0,
        counter = counter + 1;
        sigmas_D_pos(counter) = sigmas_D(i);
    end
end

if OptimalStep == 1,
    for i=1:Numberofsteps,
        rj    = Dmatrix*Out_Landweber-transpose(Matrix)*y;
        rj_array(i) = norm(rj);
        alpha = (norm(rj))^2/(transpose(rj)*Dmatrix*rj);
        Out_Landweber = Out_Landweber + alpha*transpose(Matrix)*(y - Matrix*Out_Landweber);
        if(cutofzero==1),
            Out_Landweber = (Out_Landweber>=0).*Out_Landweber;
        end
        if(error>0)
            if(error>norm(rj))
                break
            end
        end
    end
else, 
    sigma_1 = min(sigmas_D_pos);
    alpha   = 2/(sigma_1+sigma_r);
    for i = 1:Numberofsteps,
        rj    = Dmatrix*Out_Landweber-transpose(Matrix)*y;
        rj_array(i) = norm(rj);
        Out_Landweber = Out_Landweber + alpha*transpose(Matrix)*(y - Matrix*Out_Landweber);
        if(cutofzero==1),
            Out_Landweber = (Out_Landweber>=0).*Out_Landweber;
        end
        if(error>0)
            if(error>norm(rj))
                break
            end
        end
    end
end

Output = Out_Landweber;
Error = rj_array;

end

