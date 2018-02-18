function [ ponto_min, valor_min, numI, historico] = quase_newton( expr, x0, toln, tolg, lim_it, tipo)
    %x0 -> ponto inicial iniciar como [x,y] %%%DIFERENTE DO GRADIENTE JEAN!!!
    %toln -> tolerancia numerica (distancia entre pontos)
    %tolg -> tolerancia do gradiente (modulo do gradiente)
    %tipo -> diz se e DFP ou BFGS (para ser BFGS, digitar 2)
    
    switch nargin
        case 5
            tipo = 1;    end
        
    xk = x0; % ponto inicial
    funcao = sym(expr); % funcao ja simbolica
    pontos = symvar(funcao); % vetor com as variaveis ja simbolicas da funcao
    %valorfuncao = subs(funcao,pontos,xk); % definindo o valor da funcao
    numI = 0;
    grad = gradient(funcao); % gradiente com as variaveis simbolicas
    gk = subs(grad,pontos,xk); % gradiente com os pontos substituidos
    tam = size(x0); %retorna vetor de dimensao 2 com numero de linha e coluna
    dim = tam(2); %seleciona o numero de dimensoes da expressao
    Hk = eye(dim); % condicao inicial de Hessiana numerica (ser identidade)
    historico = [xk, double(subs(funcao, pontos, xk))];
    
    if (norm(gk)) <= tolg
        ponto_min = xk; %xk = x0
        valor_min = subs(funcao,pontos,xk); %xk = x0
        return
    end

    historico = [historico,xk,double(subs(funcao, pontos, xk))];

    while (norm(subs(grad,pontos,xk))) > tolg;
        
            numI = numI + 1
            if numI == lim_it
                break;
            end        
            
            %definindo variaveis que serao calculadas no loop
            gk = subs(grad,pontos,xk);
            Fk = inv(Hk);
            
            %otmizacao escalar
            dk = -mtimes(Hk,gk);
            syms a;
            funcao_de_a = subs(funcao,pontos,xk+a*transpose(dk));
            funstring = char(funcao_de_a);
            ak = double(aurea4(funstring, 0.01, [-50,50]));
            
            %expressao final
            xk1 = double(xk - ak*transpose(mtimes(inv(Fk),gk)));
            
            %definicao das saidas
            ponto_min = xk1;
            valor_min = double(subs(funcao,pontos,xk1));
            gk1 = double(subs(grad,pontos,xk1)); 
            
            %calculo do novo Hk por DFP
            %definicao das variaveis
            gama = double(gk1 - gk);
            delta = double(xk1 - xk);
            deltaT = transpose(delta); % Delta esta escrito em forma de pontos, enquanto gama em vetor, transpondo acertamos as dimensoes
            
            %%conferir, pq para funcionar o gama e o delta tem que ser
            %%necessariamente matrizes (2x1) e nao (1x2) aparentemente ele
            %%ja poe as matrizes em forma de vetores colunas, MAS CONFERIR
            
            %conferir a tolerancia numerica (toln)
            if norm(xk1-xk) < toln
                break;
            end
            
            if (tipo == 2) %caso BFGS
                %termo0 = Hk
                %termo1 = (delta*gamaT*H+H*gama*deltaT)/deltaT*gama
                %e assim sucessivamente pelos proximos termos
                termo1 = double((mtimes(deltaT,transpose(gama))))*Hk+Hk*double(mtimes(gama,transpose(deltaT)))/double(mtimes(transpose(deltaT),gama));
                termo2 = double(mtimes((mtimes(transpose(gama),Hk)),gama))/double(mtimes(transpose(deltaT),gama));
                termo3 = double(mtimes(deltaT,transpose(deltaT)))/double(mtimes(transpose(deltaT),gama));
                
                %escrevendo a expressao, detalhe termos 2 e 3 sao escalares
                %finalmente:
                Hk1 = Hk - termo1 +(1 + termo2)*termo3;
                
            else %caso DFP
                fracao1 = mtimes(mtimes(Hk,gama),mtimes(transpose(gama),Hk))/double(mtimes(mtimes(transpose(gama),Hk),gama));
                fracao2 = double(mtimes(deltaT,transpose(deltaT)))/double(mtimes(transpose(deltaT),gama));
                Hk1 = Hk - fracao1 + fracao2;
            end
            
            %atribuindo por fim os novos valores de iteracao
            Hk = Hk1;
            xk = xk1;
            
            historico = [historico,xk,double(subs(funcao, pontos, xk))];

                        
    end
    
            %historico = transpose(historico)   
            disp(historico);
            
            disp(numI);
            
            disp(valor_min);