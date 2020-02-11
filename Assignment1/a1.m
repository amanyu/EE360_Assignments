Vin = 10;
L = 20e-6;
C = 300e-6;
R = 0.5;
e = exp(1);
tau = 2*R*C;

a = 1/(R*C);
b = 1/(L*C);
% equation is  v'' + av' + bv = bVin
% v0 = vh + vp 
% vp = Vin
p = [ 1 a b ];
r = roots( p );
% r has imaginary roots : underdamped

w = imag(r(1));
att = abs(real(r(2)));

% v0 = Vin + exp(-att*t)[c1*cos(wt) + c2*sin(wt)]
% v0(t =0+) = 0  and iL(t =0+) = 0
c1 = -Vin;
c2 = -att*Vin/w;

t = linspace(0,2500,50001);
t = t* 10.^-6;
v0 = Vin + exp(-att*t).*(c1*cos(w*t) + c2*sin(w*t));
plot(t,v0)
t1 = 5e-6;
v1 = Vin + exp(-att*t1).*(c1*cos(w*t1) + c2*sin(w*t1));

% IL = v0/R + cV0'

IL = v0/R + C * ( -att*(v0-Vin) + w*(exp(-att*t).*(-c1*sin(w*t) + c2*cos(w*t))));
hold;
plot(t,IL);
