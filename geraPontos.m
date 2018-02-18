function [pop] = geraPontos(pontoInicial, tamanho)
%ponto inicial = [x,y]
dimensao = size(pontoInicial);
pop = [];
for k=1:dimensao(2)
    
    x1 = random('Normal',pontoInicial(k),5,tamanho,1); %para a determinada dimensão, gera "tamanho" pontos aleatórios com média na dimensão e variança 5                                                                                                     %5.
                                                       
    pop = cat(2,pop,x1);
end
