N = 100; % liczba wierszy
M = 100; % liczba kolumn

% Macierz A

A = speye(N * M);

for i = 2 : (N - 1)
    for j = 2 : (M - 1)
        
        k  = i + (j - 1) * N;
        k1 = (i - 1) + (j - 1) * N;
        k2 = (i + 1) + (j - 1) * N;
        k3 = i + (j - 1 - 1) * N;
        k4 = i + (j - 1 + 1) * N;
        
        A(k, k) = 4;
        A(k, k1) = -1;
        A(k, k2) = -1;
        A(k, k3) = -1;
        A(k, k4) = -1;        
    end
end

b = zeros(N * M, 1);

for i = 1 : N
    j = 1;
    k = i + (j - 1) * N;
    b(k) = 80; % temperatura z lewej strony
    j = M;
    k = i + (j - 1) * N;
    b(k) = 20; % temperatura z prawej strony
end

for j = 1 : M
    i = 1;
    k = i + (j - 1) * N;    
    b(k) = 80; % temperatura z lewej strony
    i = M;
    k = i + (j - 1) * N;    
    b(k) = 20; % temperatura z prawej strony
end

% A = sparse(A);

tic
T = A \ b;
toc

T = reshape(T, N, M);

contour(T,20:5:80, 'ShowText', 'on');
grid on;
grid minor;
axis ij;
axis equal;

