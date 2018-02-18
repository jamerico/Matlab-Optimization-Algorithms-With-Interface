function [pontosRecombinados] = crossover(melhoresPontos,alpha)
%alpha = coeficiente de exploracao
%   O objetivo desas funcao é gerar todas combinacoes dois a dois de cada
%   vetor linha da dimensao K da matriz de melhoresPontos
dimensao = size(melhoresPontos);
pontosRecombinados = [];
colunaDeNovosPontos = [];
%------------- parametros aleatórios
r = random('Uniform',0,1);
gama = (1+2*alpha)*r-alpha;

%------------------ gera combinacao dois a dois de cada dimensao da matriz
for k=1:dimensao(2)
    disp('to aqui');
    combinacao = nchoosek(melhoresPontos(:,k),2); %combina o vetor linha da dimensao k
    %pontosRecombinatos = cat(pontosRecombinados,combinacao)
   
    %---------------------------- 
        
        sizeComb = size(combinacao);
        for kk=1:sizeComb(1)
            C1 = gama*combinacao(kk,1)+(1-gama)*combinacao(kk,2); %filho 1
            C2 = (1-gama)*combinacao(kk,1)+(1-gama)*combinacao(kk,2); %filho 2
            colunaDeNovosPontos = cat(1,colunaDeNovosPontos,[C1;C2]); %adiciona o vetor coluna [c1;c2] à colunaDeNovosFilhos
        end
        
        
        
        
        pontosRecombinados = cat(2,pontosRecombinados,colunaDeNovosPontos); %adiciona o vetor coluna calculado à matriz
        colunaDeNovosPontos = [];    
end

pontosRecombinados = cat(1,pontosRecombinados,melhoresPontos);

size(pontosRecombinados)