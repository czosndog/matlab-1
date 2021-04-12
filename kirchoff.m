Imax = 0.100; % natężenia prądu - w amperach

V1 = 9.0;  % napięcia - wartość w woltach
V2 = 1.5;  

R1 = 1000; % oporności - wartość w omach
R2 = 1000;
R3 = 1000;

A = [
    -1  0 -1 +1  0
     0 -1 +1  0 -1
     R1 0  0  0  0
     0  R2 0  0  0
     0  0  R3 0  0
    ];

b = [
    0
    0
    V1
    V2
    (V1-V2)
    ];

disp('natężenia prądów [w amperach]');

I = A \ b

if any(abs(I) >= Imax)
    disp('natężenie prądu przekroczone');
else
    disp('natężenie prądu w dopuszczalnym zakresie');
end
