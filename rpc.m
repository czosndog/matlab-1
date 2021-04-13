N = 200; % liczba wierszy
M = 200; % liczba kolumn

% Macierz A

A = speye(N * M);

for i = 2 : (N - 1)
    for j = 2 : (M - 1)        
        k  = i + (j - 1) * N;        
        A(k, k) = 4;
        A(k, k - 1) = -1;
        A(k, k + 1) = -1;
        A(k, k - M) = -1;
        A(k, k + M) = -1;        
    end
end

b = zeros(N * M, 1);

for i = 1 : N  % pętla po numerze wiersza
    j = 1;
    k = i + (j - 1) * N;
    b(k) = 100; % temperatura z lewej strony
    j = M;
    k = i + (j - 1) * N;
    b(k) = 20; % temperatura z prawej strony
end

for j = 1 : M  % pętla po numerze kolumny
    i = 1;
    k = i + (j - 1) * N;    
    b(k) = 20; % temperatura u góry
    i = M;
    k = i + (j - 1) * N;    
    b(k) = 20; % temperatura u dołu
end

%A = sparse(A);

tic
T = A \ b;
toc

T = reshape(T, N, M);

contour(T,20:5:80, 'ShowText', 'on');
grid on;
grid minor;
axis ij;
axis equal;

