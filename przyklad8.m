clc
clear

% Trzy razy tworzenie takiej samej macierzy,

N = 2000;  % liczba wierszy (kolumn) macierzy kwadratowej

% Trikowy sposób, wygląda sprytnie i działa,
% ale nie jest to czytelne - więc to nie jest dobre.

tic

A = zeros(N);
A(N:N-1:end-1) = -10;
A(N-1:N-1:end-N-1) = -5;
A(N+1:N-1:end) = 5;

toc

tic

% Lepszy sposób - użycie funkcji takich jak eye i diag
% - a potem jeszcze "lustrzane odbicie w pionie" przez fliplr

B = 10 * eye(N) + ...
    diag(-5 * ones(N-1,1), 1) + ...
    diag( 5 * ones(N-1,1), -1);
B = fliplr(B);

toc

% Mała modyfikacja poprzedniego podejścia
% - dodatkowe macierze C_main, C_above i C_below
% są po to aby od razu było widzać z czego składa
% się macierz C.

tic

C_main  = 10 * eye(N);
C_above = diag(-5 * ones(N-1,1), 1);
C_below = diag( 5 * ones(N-1,1), -1);
C = C_main + C_above + C_below;
C = fliplr(C);

toc
