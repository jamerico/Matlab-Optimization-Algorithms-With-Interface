function [min, val, numI] = Fibo_Ph(expr, tol, limites, grafbool, lim_it)
    switch nargin
        case 3
            lim_it = -1;
            grafbool = 0;
        case 4
            lim_it = -1;
    end
    x=symvar(expr);
    
    k=limites(1):0.1:limites(2);
    funcao=double(subs(expr,x,k));
    plot(k,funcao)
    hold on
    
    %falta adicionar o limite de reducoes desejado
    raiz5 = (5)^(1/2);
    temp = (limites(2)-limites(1))/tol;
    Reducoes = 1;
    while ((raiz5/5)*(((1+raiz5)/2)^(Reducoes+1)-((1-raiz5)/2)^(Reducoes+1))) < temp
        Reducoes = Reducoes + 1;
    end
    if lim_it > Reducoes + 1
        q = Reducoes;
    end
    q = Reducoes + 1; %q is the new k. "k" foi reservada pelo jean
    p=(1-raiz5)/(1+raiz5);
    alfa = ((2/(1+raiz5))*((1-(p)^(q))/(1-(p)^(q+1))));
    numI=1;
    x4=limites(2);
    x1=limites(1);
    while x4-x1 > tol    %adicionar um while aqui
        x1=limites(1);
        x4=limites(2);
        Linicial=limites(2)-limites(1);
        x2=alfa*x1+(1-alfa)*x4;
        f2=subs(expr,x,x2);
        x3=alfa*x4+(1-alfa)*x1;
        f3=subs(expr,x,x3);
        if f2<f3
            limites(1)=x1;
            limites(2)=x3;
            min=limites(2);
            Lfinal=limites(2)-limites(1);
            if numI==lim_it
                break;
            end
            alfa = (Linicial - Lfinal)/Lfinal;
            numI = numI + 1;
        else 
            limites(1)=x2;
            limites(2)=x4;
            min=limites(1);
            Lfinal=limites(2)-limites(1);
            if numI==lim_it
                break;
            end
            alfa = (Linicial - Lfinal)/Lfinal;
            numI = numI + 1;
        end
        val=double(subs(expr,x,min));
        if grafbool ==1
            plot(min,val,'r-o');
        end
    
    end
    if grafbool==0
        plot(min,val,'r--s');
    end
    hold off
end

