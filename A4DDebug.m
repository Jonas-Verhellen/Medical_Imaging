%% Debugging A4D

% 1. Using the given test function, to check the line of response.

FF = figure;
set(FF,'name','Debug A4D','numbertitle','off')
PlotA4D(A4D,Theta,S) 

% 2. Tests the structure of A for a single value of 0<phi<pi/4 and s>0.

B = zeros(N,N);
a = N/2+6;
b = N/4*2+6;
for i=1:N,
    for j=1:N,
        B(i,j) = A4D(a,b,j,N+1-i);
    end
end


