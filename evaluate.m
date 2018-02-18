function [xyf]=evaluate(funcao, pontos)
funcao=sym(funcao);
variables=symvar(funcao);
i=1;
xyf=[];
tamanho=size(pontos);
tamanho=tamanho(1);
while i<(tamanho+1)
    linha=[pontos(i,:) double(subs(funcao,variables,pontos(i,:)))];
%     disp(linha)
    xyf=[xyf;linha];
%     disp(xyf)
    i=i+1;
%     disp(i)
end
