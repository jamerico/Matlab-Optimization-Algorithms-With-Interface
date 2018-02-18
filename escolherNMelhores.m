function[popSelecionada] = escolherNMelhores(pop, n)
sortPop(pop);
tamanho = size(pop);
tamanho = tamanho(1);
i=1;
popSelecionada=[];
if n>tamanho
    popSelecionada = pop;
    disp('A nova população eh igual a antiga, uma vez que a nova populacao desejada era maior que a antiga populacao existente')
else
    while i<(n+1)
        popSelecionada = [popSelecionada; pop(i,:)];
        i=i+1;
    end
end