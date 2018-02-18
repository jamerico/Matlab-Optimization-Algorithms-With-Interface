function [pop]=sortPop(pop)
tamanho=size(pop);
tamanho=tamanho(2);
pop=sortrows(pop,tamanho);