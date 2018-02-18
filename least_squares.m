y_str = '1 + (p2*exp(p1*t) - p1*exp(p2*t))/(p1-p2)';
y = sym(y_str);
variables = symvar(y);
%------------------- Total de amostras
ti = [1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00, 9.00, 10.00];
m = [0.25, 0.56, 0.72, 0.81, 0.89, 0.92, 0.97, 0.97, 0.98, 0.99];

%para tr�s amostras
% ti = [1.00, 3.00, 10.00]
% m = [0.25, 0.72, 0.99];

%para cinco amostras
% ti = [1.00, 2.00, 3.00, 5.00, 9.00];
% m = [0.25, 0.56, 0.72, 0.89, 0.98];

s = 0;
y_ti = subs(y, variables(3), ti);
e = (m - y_ti).^2;
for ei = e
    s = s + ei
end;


pretty(s)
%Compara��o do resultado H&J
%---------------------------------------
%Tr�s amostras
% mh = subs(y_ti, variables(1), -0.538);
% mhh = subs(mh, variables(2), -1.913);
%erro = 0.00005

%cinco amostras
% mh = subs(y_ti, variables(1), -2.2769)
% mhh = subs(mh,variables(2), -0.5151);
% erro = 0.0006

% %10 amostras
% mh = subs(y_ti, variables(1), -2.5088)
% mhh = subs(mh,variables(2), -0.49316);
% erro = 0.0006



%Compara��o do resultado Genetico
%---------------------------------------

% 3 amostras
% p1 = -0.50921
% p2 = -2.2143


%5 amostras
% p1 = -2.383
% p2 = -0.504

%10 Amostras
p1 = -2.84
p2 = -0.47

mh = subs(y, variables(1), p1);
mhh = subs(mh,variables(2), p2);


%plot continuo
tt = 1:0.1:10;
ff = double(subs(mhh,variables(3),tt));

%plot(tt,ff)
plot(ti,m,tt,ff,'LineWidth',1.5)
 
% 
% plot(t,ff)





%plot(ti,m,'o')


