function [ Y1, Y2, Y3 ] = intpol_henrique( X1, X2, X3, X4, X5 )
%INTERPOLAÇÃO QUADR�?TICA Aproxima o mínimo de uma função objetivo utilizando o método numérico iterativo da interpolação quadrática 
v = X3(1):0.1:X3(2);
x = symvar(X1);
f = subs(X1, x, v);
plot(v, f);
hold on;
x1=X3(1);
x3=X3(2);
x2=(x1+x3)/2;
ra = (sqrt(5)-1)/2;
e = 1e-8;
fx1 = subs(X1, x, x1);
if X5
    plot (x1, fx1, 'go');
end
fx2 = subs(X1, x, x2);
if X5
    plot (x2, fx2, 'yo');
end
fx3 = subs(X1, x, x3);
if X5
    plot (x3, fx3, 'bo');
end
A = [double(x1^2) double(x1) double(1); double(x2^2) double(x2) double(1); double(x3^2) double(x3) double(1)];
B = [double(fx1); double(fx2); double(fx3)];
C = linsolve (A, B);
a = C(1,1);
b = C(2,1);
xmin = (-b)/(2*a);
if or(xmin<x1, xmin>x3)
    if x2-x1==x3-x2
        xmin = ra*x2 + (1 - ra)*x1;
    elseif x2-x1>x3-x2
        xmin = ra*x2 + (1 - ra)*x1;
    else
        xmin = ra*x3 + (1 - ra)*x2;
    end
end
fxmin = subs(X1, x, xmin);
if X5
    plot (xmin, fxmin, 'ko');
end
k = 1
while and(and(and(abs(xmin-x1)>X2, abs(xmin-x2)>X2), abs(xmin-x3)>X2), k~=X4)
    m = max(max(fx1, fx2), fx3);
    if and(x1<xmin, xmin<x2)
        if m==fx1
            x1 = xmin;
        elseif m==fx3
            x3 = x2;
            x2 = xmin;
        end
    else
        if m==fx1
            x1 = x2;
            x2 = xmin;
        elseif m==fx3
            x3 = xmin;
        end
    end
    fx1 = subs(X1, x, x1);
    fx2 = subs(X1, x, x2);
    fx3 = subs(X1, x, x3);
    if and(and(abs(fx3-fx2)<e, abs(fx3-fx1)<e), abs(fx2-fx1)<e)
        break;
    end
    if X5
        plot (x1, fx1, 'go');
        plot (x2, fx2, 'yo');
        plot (x3, fx3, 'bo');
    end
    A = [double(x1^2) double(x1) double(1); double(x2^2) double(x2) double(1); double(x3^2) double(x3) double(1)];
    B = [double(fx1); double(fx2); double(fx3)];
    C = linsolve (A, B);
    a = C(1,1);
    b = C(2,1);
    xmin = (-b)/(2*a);
    if or(xmin<x1, xmin>x3)
        if x2-x1==x3-x2
            xmin = ra*x2 + (1 - ra)*x1;
        elseif x2-x1>x3-x2
            xmin = ra*x2 + (1 - ra)*x1;
        else
            xmin = ra*x3 + (1 - ra)*x2;
        end
    end
    fxmin = subs(X1, x, xmin);
    if X5
        plot (xmin, fxmin, 'ko');
    end
    k = k+1
end
plot (xmin, fxmin, 'ro');
Y1 = double (xmin);
Y2 = double (fxmin);
Y3 = double (k);
hold off
end