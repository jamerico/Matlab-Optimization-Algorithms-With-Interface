function [xMinimo,fMinimo, sucess] = HookeExploracao2(expr, base, incr)

    funcao = sym(expr); % funcao ja simbolica
    variaveis = symvar(funcao); % vetor com as variaveis ja simbolicas da funcao
    n1 = size(variaveis); 
    n = n1(2); %quantidade de variaveis na funcao
%----------------------------------------------------------------------------
%   Exploração
%----------------------------------------------------------------------------
    x = base;
    
    for i=1:n
        %-------------------------------------- verifica para x(i)+incr
         novox = x;
         novox(i) = novox(i)+incr;
         if double(subs(funcao,variaveis,novox)) < double(subs(funcao,variaveis,x))
             x = novox;
             continue %se é menor de um lado, não verifica do outro. Premissoa: unimodalidade
         end
        %-------------------------------------- verifica para x(i)-incr
         novox = x;
         novox(i) = novox(i)-incr;   
         if double(subs(funcao,variaveis,novox))<double(subs(funcao,variaveis,x))
             x = novox;
         end
    end
    display({'incremento',num2str(incr)})
  
   if min(x==base)
       sucess = 0;
   else
       sucess =1;
   end
   
   xMinimo = x;
   fMinimo = double(subs(funcao,variaveis,x));
   %display({'Sucess',num2str(xMinimo~=base)})
   
      