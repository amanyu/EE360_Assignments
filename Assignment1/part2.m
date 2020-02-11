v0 = 0.0;
L = 20 * 10**(-6);
Vin = 10;
C = 300 * 10**(-6);
R = 0.5;
e = 2.71;
tau = 2*R*C;
for i = 0:100
  t = linspace(0,5,50);
  t = t*10**(-6);
  if mod(i,2) == 0;
    y = Vin * (1-e.**(-t/tau)) + v0*(e.**(-t/tau));
    b = 5 * 10 **(-6);
    v0 = Vin * (1-e**(-b/tau)) + v0*(e**(-b/tau));
  else mod(i,2)==1;
    y = v0*(e.**(-t/tau));
    b = 5 * 10 **(-6);
    v0 = v0*(e**(-b/tau));
  endif
  tnew = t.+ i*5*10**(-6);
  plot(tnew,y)
  hold on
endfor