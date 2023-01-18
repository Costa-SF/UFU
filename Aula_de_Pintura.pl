resolve(Sol) :-
    Sol = aula(_,_,_,_,_),
    %A Economista est� ao lado da aluna que est� pintando uma tela no estilo Impressionista.
    al(A,Sol),
    profissao(A,economista),
    aolado(A,B,Sol),
    estilo(B,impressionista),

    %A Professora tem 40 anos.
    al(C,Sol),
    idade(C,40),
    profissao(C,professora),

    %A mulher de avental Amarelo est� exatamente � esquerda da mulher de avental Verde.
    avental(D,amarelo),
    exat_esquerda(D,E,Sol),
    avental(E,verde),

    %Angela est� na quinta posi��o.
    al(F,Sol),
    nome(F,angela),
    quinta(F,Sol),

    %Quem est� pintando uma obra Abstrata est� ao lado de quem est� pintando uma obra Impressionista.
    estilo(G,abstrata),
    aolado(G,H,Sol),
    estilo(H,impressionista),

    %Em uma das pontas est� a aluna mais nova.
    pontas(I,Sol),
    idade(I,30),

    %Ieda est� exatamente � direita da aluna que est� pintando uma tela Cubista.
    al(J,Sol),
    nome(J,ieda),
    exat_direita(J,K,Sol),
    estilo(K,cubista),

    %A Advogada est� ao lado da Economista.
    profissao(L,advogada),
    aolado(L,M,Sol),
    profissao(M,economista),

    %A mulher de avental Branco est� ao lado da mulher que est� pintando uma tela Expressionista.
    avental(N,branco),
    aolado(N,O,Sol),
    estilo(O,expressionista),

    %Em uma das pontas est� a aluna de avental Verde.
    pontas(P,Sol),
    avental(P,verde),

    %A aluna da tela de tamanho 60x80 cm est� ao lado da aluna que est� fazendo uma pintura Abstrata.
    tela(Q,'60x80'),
    aolado(Q,R,Sol),
    estilo(R,abstrata),

    %Heloisa est� exatamente � esquerda da mulher de 35 anos.
    nome(S,heloisa),
    exat_esquerda(S,T,Sol),
    idade(T,35),

    %A Advogada est� em algum lugar � direita da aluna de avental Amarelo.
    profissao(U,advogada),
    a_direita(U,V,Sol),
    avental(V,amarelo),

    %Na terceira posi��o est� a aluna que est� pintando na tela de tamanho 60x80 cm.
    al(W,Sol),
    terceira(W,Sol),
    tela(W,'60x80'),

    %A dona da tela de 40x50 cm est� em algum lugar entre a mulher de 35 anos e a dona da tela de 30x40 cm, nessa ordem.
    tela(Z,'40x50'),
    entre(X,Y,Z,Sol),
    idade(X,35),
    tela(Y,'30x40'),

    %A aluna de 45 anos est� pintando na maior tela.
    al(Z1,Sol),
    idade(Z1,45),
    tela(Z1,'80x120'),

    %A Vendedora est� ao lado da mulher de avental Vermelho.
    profissao(Z2,vendedora),
    aolado(Z2,Z3,Sol),
    avental(Z3,vermelho),

    %A Professora est� usando avental Azul.
    al(Z4,Sol),
    profissao(Z4,professora),
    avental(Z4,azul),

    %Maria est� exatamente � esquerda da aluna mais Velha.
    nome(Z5,maria),
    exat_esquerda(Z5,Z6,Sol),
    idade(Z6,50),

    %A mulher de 45 anos est� ao lado da mulher que est� pintando uma tela Surrealista.
    idade(Z7,45),
    aolado(Z7,Z8,Sol),
    estilo(Z8,surrealista),

    %A obra Expressionista est� sendo pintada na tela de tamanho 60x80 cm.
    al(Z9,Sol),
    estilo(Z9,expressionista),
    tela(Z9,'60x80'),

    %Fechamento
    al(Z10,Sol),
    nome(Z10,cristina),
    al(Z11,Sol),
    tela(Z11,'50x60'),
    al(Z12,Sol),
    profissao(Z12,medica).

al(X,aula(X,_,_,_,_)).
al(X,aula(_,X,_,_,_)).
al(X,aula(_,_,X,_,_)).
al(X,aula(_,_,_,X,_)).
al(X,aula(_,_,_,_,X)).

avental(aluna(X,_,_,_,_,_),X).
nome(aluna(_,X,_,_,_,_),X).
estilo(aluna(_,_,X,_,_,_),X).
tela(aluna(_,_,_,X,_,_),X).
idade(aluna(_,_,_,_,X,_),X).
profissao(aluna(_,_,_,_,_,X),X).

primeira(X,aula(X,_,_,_,_)).
segunda(X,aula(_,X,_,_,_)).
terceira(X,aula(_,_,X,_,_)).
quarta(X,aula(_,_,_,X,_)).
quinta(X,aula(_,_,_,_,X)).

pontas(X,aula(X,_,_,_,_)).
pontas(X,aula(_,_,_,_,X)).

exat_esquerda(X,Y,aula(X,Y,_,_,_)).
exat_esquerda(X,Y,aula(_,X,Y,_,_)).
exat_esquerda(X,Y,aula(_,_,X,Y,_)).
exat_esquerda(X,Y,aula(_,_,_,X,Y)).

exat_direita(X,Y,Aula) :-
   exat_esquerda(Y,X,Aula).

a_direita(X,Y,aula(Y,X,_,_,_)).
a_direita(X,Y,aula(Y,_,X,_,_)).
a_direita(X,Y,aula(Y,_,_,X,_)).
a_direita(X,Y,aula(Y,_,_,_,X)).
a_direita(X,Y,aula(_,Y,X,_,_)).
a_direita(X,Y,aula(_,Y,_,X,_)).
a_direita(X,Y,aula(_,Y,_,_,X)).
a_direita(X,Y,aula(_,_,Y,X,_)).
a_direita(X,Y,aula(_,_,Y,_,X)).
a_direita(X,Y,aula(_,_,_,Y,X)).

a_esquerda(X,Y,Aula) :-
    a_direita(Y,X,Aula).

aolado(X,Y,aula(X,Y,_,_,_)).
aolado(X,Y,aula(Y,X,_,_,_)).
aolado(X,Y,aula(_,X,Y,_,_)).
aolado(X,Y,aula(_,Y,X,_,_)).
aolado(X,Y,aula(_,_,X,Y,_)).
aolado(X,Y,aula(_,_,Y,X,_)).
aolado(X,Y,aula(_,_,_,X,Y)).
aolado(X,Y,aula(_,_,_,Y,X)).

entre(X,Y,Z,aula(_,X,Z,Y,_)).
entre(X,Y,Z,aula(X,_,Z,Y,_)).
entre(X,Y,Z,aula(_,_,X,Z,Y)).
entre(X,Y,Z,aula(_,X,_,Z,Y)).
entre(X,Y,Z,aula(_,X,Z,_,Y)).
entre(X,Y,Z,aula(X,_,Z,_,Y)).
entre(X,Y,Z,aula(X,_,_,Z,Y)).
entre(X,Y,Z,aula(X,Z,_,_,Y)).
entre(X,Y,Z,aula(X,Z,_,Y,_)).
entre(X,Y,Z,aula(X,Z,Y,_,_)).
