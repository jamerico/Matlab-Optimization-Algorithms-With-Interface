function [xMinimo,fMinimo, sucess] = HookeExploracao(expr, base, incr)

    funcao = sym(expr); % funcao ja simbolica
    variaveis = symvar(funcao); % vetor com as variaveis ja simbolicas da funcao
    n1 = size(variaveis); 
    n = n1(2); %quantidade de variaveis na funcao
%----------------------------------------------------------------------------
%   Exploração
%----------------------------------------------------------------------------
    x = base;
    xDoMin = [];
    fMin = [];
    for i=1:n
              
        x(i) = x(i);
        tempXmin(1) = x(i);
        tempfMin(1) = double(subs(funcao,variaveis,x));
        
        x(i) = x(i)+incr(i);
        tempXmin(2) = x(i);
        tempfMin(2) = double(subs(funcao,variaveis,x));
        
        x(i) = x(i)-2*incr(i); %fazendo x(i) = x(i) - incr
        tempXmin(3) = x(i);
        tempfMin(3) = double(subs(funcao,variaveis,x));
        x(i) = x(i)+incr(i); %retorna para o original
        
        fMin(i) = min(tempfMin);
        tempfMin;
        indiceMin = find(tempfMin==fMin(i)); %retorna o indice da funcao minima no vetor tempfMin
        xDoMin(i) = tempXmin(1,indiceMin);
        %--------------------------------------------
        xmin(i) = xDoMin(i);    %andamos com a base de acordo com o mínimo da primeira variavel  
    end
%     display({'base','f(base)',num2str(base),double(subs(funcao,variaveis,base))})  
    xMinimo = xmin;
    fMinimo = double(subs(funcao,variaveis,xMinimo));
%     display({'xMinimo','fMinimo',num2str(xMinimo),double(subs(funcao,variaveis,xMinimo))}) 
    display({'incremento',num2str(incr)})
  
    for i=1:n
        if xMinimo(i)==base(i)
            incr(i) = incr(i)*0.9;
            
        end
    end
    
    if min(xMinimo==base)
        sucess =0;
    else
        sucess =1;
    end
        
   %display({'Sucess',num2str(xMinimo~=base)})
   
      