function [min,val, numI] = aurea4(expr,tol,limites,grafbool,lim_it)
%expr = string da equação, tol = tolerancia, [li,lf] = vetor com lim_its
%inferior e superior, lim_it = lim_it de interações, grafbool = booleano
%que diz se quer ou não o gráfico
    switch nargin
        case 3
            lim_it = -1;
            grafbool = 0;
        case 4   
            lim_it = -1;
    end
    %Setando defaults para as variavéis
    numI = 0;
    x = symvar(expr);
    ra = 0.61803398875;
    x1 = limites(1);
    x4 = limites(2);
    %verificar se deseja plotar
   
    
    k = limites(1):0.1:limites(2);
    funcao = subs(expr,x,k);
    plot(k,funcao)
    hold on
    
    %inicio do algoritmo de razao aurea    
    numI = 0;
    min = x1;
    val = subs(expr,x,min);
    x3 = x1+ra*(x4-x1);
    x2 = x1+(1-ra)*(x4-x1);
    f2 = double(subs(expr,x,x2));
    f3 = double(subs(expr,x,x3));
    while abs(x1-x4) > tol;
        numI = numI + 1;
        if numI == lim_it
            break;
        end
        if f2 > f3
            x1 = x2;
            x2 = x3;
            x3 = x4-(1-ra)*(x4-x1);
            f2 = double(subs(expr,x,x2));
            f3 = double(subs(expr,x,x3));
            min = x2;
            val = double(subs(expr,x,min));
        else
            x4 = x3;
            x3 = x2;
            x2 = x1+((1-ra)*(x4-x1));
            f2 = double(subs(expr,x,x2));
            f3 = double(subs(expr,x,x3));
            min = x3;
            val = double(subs(expr,x,min));
        end;
        if grafbool==1
            plot(min,val,'r-o'); 
        end
        
    end;
    if grafbool==0
        plot(min,val,'r--s');
    end
    hold off
end            