v0 = 0.0;
L = 20 * (10.^(-6));
Vin = 10;
C = 300 * 10.^(-6);
R = 0.5;
e = exp(1);
tau = 2*R*C;
t = linspace(0,1000,50);
t = t*10.^(-6);
v = Vin * (1-e.^(-t/tau));
i = v./R + (Vin/(2*R)) .* (e.^(-t/tau));
plot(t,v)