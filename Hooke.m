function [ ponto_min, valor_min, numI, historico] = Hooke(expr, x0, incr, tol, lim_it )
%----------------------------------------------------------------------------
%   Setup Inicial
%----------------------------------------------------------------------------
%incr = incremento
%tol = tolerancia, em forma de vetor linha -> cada coluna uma variavel
x = x0; % ponto inicial
numI = 0;
funcao = sym(expr); % funcao ja simbolica
variaveis = symvar(funcao); % vetor com as variaveis ja simbolicas da funcao
n1 = size(variaveis);
n = n1(2); %quantidade de variaveis na funcao

%----------------------------------------------------------------------------
%   Progressão
%----------------------------------------------------------------------------
%historico = horzcat(x0,double(subs(funcao,variaveis,x0)));
historico = [];
while max(incr)>tol && numI<lim_it
    disp({'x','f(x)',num2str(x),double(subs(funcao,variaveis,x))})
    
    [x1,fMin,sucess] = HookeExploracao2(expr,x,incr);  %procura o minimo ao redor da base
    historico = horzcat(historico,x,double(subs(funcao,variaveis,x)));
    %historico = horzcat(historico,x1,fMin);
    
    
    disp({'x1','f(x1)',num2str(x1),num2str(fMin)})
    sucess
    if sucess ==1
        x2 = 2*x1-x; %tentativa de progressão
        %disp({'tentativa de progressao', num2str(x2),double(subs(funcao,variaveis,x2))})
        %disp({'ponto atual', num2str(x1),fMin})
        
        numI = numI+1;
        while double(subs(funcao,variaveis,x2))<fMin
            historico = horzcat(historico,x2,double(subs(funcao,variaveis,x2)));
            disp({'progressão OK', num2str(x2),double(subs(funcao,variaveis,x2))})
            
            fMin = double(subs(funcao,variaveis,x2)); %f(x2) antigo. Para comparar com progressoes suscessivas 
            
            x1 = x2; %progressão antiga vira a a nova direcao de minimo
            x = x1; %a base agora é a direcao de minimo antiga
            x2 = 2*x1-x;   %fazendo mais uma progressão
            
            
        end
        if double(subs(funcao,variaveis,x2))>fMin
            disp({'progressão falhou',num2str(x2),double(subs(funcao,variaveis,x2))});
            x = x1; %caso contrário, continua em x1 p exploração
        end
        
    else
        
        display('a base foi reduzida')
        
        
        incr = incr/2;
        x = x1;
    end
    
    
end

ponto_min = x1;
valor_min = fMin;



    
    
            
            