function [popMutada] = mutacao(pop,beta)
%modulo de beta. 
dimensao = size(pop);
i=1;
dimPop=size(pop);
dimPop=dimPop(2);
delta=[];
tamanhoPop=size(pop);
tamanhoPop=tamanhoPop(1);

vetorMutada = [];
popMutada = [];
%o while abaixo determina a diferença entre o maximo e o minimo de cada
%dimensao (Xmax-Xmin, Ymax-Ymin...)

while i<=dimPop
    pop=sortrows(pop,i);
    deltaxi=(pop(tamanhoPop,i)-pop(1,i));  %delta da i-esima dimensão
    delta=[delta deltaxi];
    i=i+1;
end


for kk=1:dimensao(2)   %de kk=1 ate a quantidade de dimensoes
    for k=1:dimensao(1)  %de k=1 ate a quantidade de linha
        for y=1:2 %10 vezes para cada x
            alpha = random('Uniform',-beta,beta); %fator multiplicativo entre 0 e 0.5
            vetorMutada = cat(1,vetorMutada,pop(k,kk)+alpha*delta(1,kk));
         end
        
    end
    popMutada = cat(2,popMutada,vetorMutada);
    vetorMutada = [];
end
popMutada = cat(1,popMutada,pop);
size(popMutada)        