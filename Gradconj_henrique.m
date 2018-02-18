function [Y1, Y2, Y3, Y4] = Gradconj_henrique (X1, X2, X3, X4, X5)
f = sym (X1);
variables=symvar(f);
dimensions = size(symvar(f));
ea = 10^-08;
er = 10^-08;
f0 = double(subs (f, variables, X2));
point = zeros([1, dimensions(2)]);
g0 = zeros([1, dimensions(2)]);
for a = 1:dimensions(2)
    b = diff(f, variables(a));
    g0(a) = double(subs (b, variables, X2));
    point(a) = double(X2(a));
end
fs = [point, f0];
if norm(g0)<X3
    Y1 = X2;
    Y2 = f0;
    Y3 = 0;
    Y4 = fs;
    return
end
d0 = -g0;
syms alpa;
f_alpha = subs(f, variables, X2 + alpa*d0);
f_alpha_str = char (f_alpha);
Yaurea = aurea4 (f_alpha_str, 10^-08, [-100, 100], 0, 50);
alpha_r = Yaurea(1);
x1 = X2 + alpha_r*d0;
f1 = double(subs (f, variables, x1));
g1 = zeros([1, dimensions(2)]);
for a = 1:dimensions(2)
    b = diff (f, variables(a));
    g1(a) = double(subs (b, variables, x1));
    point(a) = double(x1(a));
end
fs = [fs, point, f1];
k=1;
while norm (g1)>X3 && abs(f1-f0)>ea + er*abs(f0) && k~=X4
    if rem (k, dimensions(2)) == 0
        d1 = -g1;
    else
        if X5 == 0
            beta = (norm(g1) - g1*transpose(g0))/(norm(g0));
            d1 = -g1 + beta*d0;
        else
            beta = (norm(g1))/(norm(g0));
            d1 = -g1 + beta*d0;
        end
    end
    syms alpa;
    f_alpha = subs(f, variables, x1 + alpa*d1);
    f_alpha_str = char (f_alpha);
    Yaurea = aurea4 (f_alpha_str, 10^-08, [-100, 100], 0, 50);
    alpha_r = Yaurea(1);
    x2 = x1 + alpha_r*d1;
    f2 = double(subs (f, variables, x2));
    g2 = zeros([1, dimensions(2)]);
    for a = 1:dimensions(2)
        b = diff (f, variables(a));
        g2(a) = double(subs (b, variables, x2));
        point(a) = double(x2(a));
    end
    fs = [fs, point, f2];
    k = k + 1;
    x1 = x2;
    f0 = f1;
    f1 = f2;
    g0 = g1;
    g1 = g2;
    d0 = d1;
end
Y1 = x1;
Y2 = f1;
Y3 = k;
Y4 = fs;
end