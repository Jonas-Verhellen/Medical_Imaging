%% Determening a part of 4AD by josephs method

A4D = zeros(N,N,N,N);                                   % 4D matrix A4D, later -> 2D matrix A2D

for i = N/2+1:3*N/4,                                    % Only loop over 0=<phi=<pi/4
    phi = Phi(i);
    tan_phi = tan(phi);                                 % Precalculate the tangent
    c       = dB/cos(phi);
    for j = N/2+1:N,                                    % Only loop over s>0 
        s       = S(j);             
        x_0     = -s*sin(phi);                          % Using the formula for a given s, phi both of which are looped over (_o for closest approach)
        y_0     =  s*cos(phi); 
        x       = (1-N)*dB/2;                           % Go to most left x value (important to keep inside this loop -> need to this for each ray, this also determines the intial y value)
        y       = -(x_0-x)*tan_phi+y_0;
        y_index = N/2 + floor(y/dB)+1;                  % The y indices begin at the bottom, this is the index of the first voxel's centre encountered (above the point (x,y))
        l       = y/dB-floor(y/dB)+0.5;
        for k = 0:N-1,                                  % Loop over the steps of the LOR
            x_index = 1 + k;
            if( l >= 1),                                % Implementation of Josephs trick
                y_index = y_index + 1;
                l       = l - 1; 
            end
            if(y_index > N),
                break
            end
            if( 1 < y_index),                           % More elegant solution? Is this a useful check? 
                A4D(i,j,x_index,y_index-1) = c*(1-l);
                A4D(i,j,x_index,y_index) = c*l;
            end
            l = l + tan_phi;
        end
    end
end

%% Implementation of the symmetry

% 1. Symmetry s to -s

for i=1:N/2,
    for j=1:N,
        for k=1:N,
            A4D(:,i,j,k) = A4D(:,N+1-i,N+1-j,N+1-k);
        end
    end
end

% 2. Symmetry phi(0->pi/4) to phi(0->pi/2)

for i=3*N/4+1:N,
    for j=1:N,
        for k=1:N,
            A4D(i,:,j,k) = A4D(N+1+N/2-i,:,N+1-k,N+1-j);
        end
    end
end


% 3. Symmetry phi(0->pi/2) to phi(-pi/2->pi/2)

for i=1:N/2,
    for j=1:N,
        A4D(i,:,j,:) = A4D(N+1-i,:,N+1-j,:);
    end
end

