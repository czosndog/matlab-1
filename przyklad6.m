a = 0;
b = 5*pi;
N = 50;

x = linspace(a, b, N);
x = x.';
y = sin(x);

D1 = diag( ones(N - 1, 1),  1);
D2 = diag(-ones(N - 1, 1), -1);
A = D1 + D2;
A(1, 1)     = -2;
A(1, 2)     =  2;
A(N, N - 1) = -2;
A(N, N)     =  2;

h = x(2) - x(1);
A = A / 2.0 / h;

figure(1);
clf;
plot(x,y);
hold all;

yp = y;
for k = 1:6
    yp = A * yp;
    plot(x,yp);
end






