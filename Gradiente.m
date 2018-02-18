function [ ponto_min, valor_min, numI, historico ] = Gradiente( expr, x0, toln, tolg, lim_it )
%x0 -> ponto inicial inserir em array com ponto e virgula Ex: [x;y]
%%%PRESTA ATENCAO NESSA OBSERVACAO DE CIMA JEAN!!!!
%toln -> tolerancia numerica (distancia entre pontos)
%tolg -> tolerancia do gradiente (modulo do gradiente)
display(' eu sou a funcao certa' )
display('aeee')
xk = x0; % ponto inicial
numI = 0;
funcao = sym(expr); % funcao ja simbolica
pontos = symvar(funcao); % vetor com as variaveis ja simbolicas da funcao
grad = gradient(funcao); % gradiente com as variaveis simbolicas
%valorfuncao = subs(funcao,pontos,transpose(xk)); % definindo o valor da funcao
gk = subs(grad,pontos,transpose(xk)); % gradiente com os pontos substituidos
historico = [transpose(xk), double(subs(funcao, pontos,transpose(xk)))];
if (norm(gk)) <= tolg
    ponto_min = xk; %xk = x0
    valor_min = subs(funcao,pontos,transpose(xk)); %xk = x0
    return
end
historico = [historico,transpose(xk),double(subs(funcao, pontos,transpose(xk)))];

while (norm(gk)) > tolg;
    
    
    if numI == lim_it
        break;
    end
    numI = numI + 1
    dk = -subs(grad,pontos,transpose(xk))/norm(subs(grad,pontos,transpose(xk)));  %vetor unitario da direcao de descida
    syms a;
    pontosT = transpose(pontos); %deixando os vetores nas mesmas dimensoes
    funcao_de_a = subs(funcao,pontosT,xk+a*dk); %funcao de a simbolica
    funstring = char(funcao_de_a); % funcao de a em forma de string
    ak = double(aurea4(funstring, 0.001, [-50,50])); %calculando o minimo
    xk1 = double(xk + ak*dk);
    
    ponto_min = xk1;
    valor_min = double(subs(funcao,pontos,transpose(xk1)));
    gk1 = double(subs(grad,pontos,transpose(xk1)));
    
    if (norm(xk1-xk)) <= toln
        break;
    end
    
    xk = xk1;
    gk = gk1;
    
    historico = [historico,transpose(xk),double(subs(funcao, pontos,transpose(xk)))];
end
disp(historico);

disp(numI);

disp(valor_min);