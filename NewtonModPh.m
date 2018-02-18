function [ pontoMinimo, f_minimo, iteracoes, historico ] = NewtonModPH( funcao, pontoInicial, tol, maxIt, enable )
%NewtonPH Summary of this function goes here
%   Essa funcao eh a implementacao do metodo de Newton para encontrar
%   minimo de funcoes vetoriais

% Entradas: Funcao que se quer minimizar, Ponto pelo qual partiremos para
% encontrar o minimo, tolerancia exigida, numero maximo de iteracoes e u
% enable para o historico de pontos percorridos.

%Saidas: Ponto em que foi encontrado um minimo, Valor da funcao no ponto de
%minimo, numero de iteracoes realizadas e historico de valores da funcao
%(nao eh historico de pontos).

%O metodo de Newton modificado aproxima a funcao por uma parabola em um dado ponto. Em
%seguida, encontra o minimo dela e usa esse minimo como novo ponto. Em
%outras palavras, ponto=ponto-(hessiana^-1)*gradiente. No entanto, ele
%altera a Hessiana para garantir que ela seja positiva definida e as
%operacoes possam ser realizadas. NewHes = Hes + gama*Identidade
tic;
ponto=transpose(pontoInicial);
numI=0;
xyz=symvar(funcao);
dim=size(xyz);
dim=dim(1);
disp(dim);
% if dim==2;
%     figure
%     ezmesh(funcao)
%     hold on
% end
%disp('xyz');
%disp(xyz);
funcao = sym(funcao);
%disp('funcao');
%disp(funcao);
grad=gradient(funcao);
%disp('grad');
%disp(grad);
hes = jacobian(gradient(funcao));
%disp('hes');
%disp(hes);
gradPonto = subs(grad, xyz, ponto);
historico=[transpose(ponto), subs(funcao, xyz, ponto)];
    while abs(gradPonto)>tol
        if numI>maxIt
            disp('Exceeded number of iterations');
            break
        end
        numI = numI + 1;

%        if any(min(eig(hesPonto)) <=0)
        hesPonto = double(subs(hes, xyz, ponto));
        gama = double(abs(min(eig(hesPonto)))+10);
        hesPonto = double(hesPonto+eye(size(hesPonto)));
        dk = double(-(hesPonto^-1)*gradPonto);
        alpha = sym('alpha');
        newFunction = subs(funcao, xyz, ponto+alpha*dk);
        aurea4(newFunction, 0.1, [-10 10], 0, 100);
    %    disp(gradPonto);
    %    disp(hesPonto);
    %    disp((hesPonto)*gradPonto);
        ponto = double(ponto-(hesPonto^-1)*gradPonto);
        gradPonto = double(subs(grad,xyz, ponto));
        if enable==1
            historico=[historico,transpose(ponto),subs(funcao, xyz, ponto)]; 
        end       
    end
    pontoMinimo = ponto;
    f_minimo = subs(funcao, xyz, ponto);
    iteracoes = numI;
    time = toc;
    disp('numI');
    disp(numI);
    disp('Elapsed time');
    disp(time);
%     if dim==2;
%         transpose(historico);        
%         plot3(historico(1),historico(2),historico(3), 'r-h')
% 
%         hold on
% 
%     end
%    disp(historico);  
end

