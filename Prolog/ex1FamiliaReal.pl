%%% Árvore genealógica da família real %%%

mae(queenelizabethii,charles).
mae(queenelizabethii,anne).
mae(queenelizabethii,andrew).
mae(queenelizabethii,edward).

mae(diana,william).
mae(diana,harry).

mae(anne,peterphillips).
mae(anne,zaratindal).

% 

pai(philip,charles).
pai(philip,anne).
pai(philip,andrew).
pai(philip,edward).

pai(charles,william).
pai(charles,harry).

pai(captainmarkphillips,peterphillips).
pai(captainmarkphillips,zaratindal).

%

homem(philip).
homem(charles).
homem(captainmarkphillips).
homem(peterphillips).
homem(andrew).

mulher(queenelizabethii).
mulher(anne).
mulher(zaratindal).

%

filho(Y,Z) :- pai(Z,Y),homem(Y).
filha(Y,Z) :- pai(Z,Y),mulher(Y).

%

irmaos(X,Y) :- pai(Z,X),mae(W,Y).
irma(X,Y) :- pai(Z,X),mae(W,Y),mulher(Y).
irmao(X,Y) :- pai(Z,X),mae(W,Y),homem(Y).

%

avo(X,Y) :- pai(X,W), pai(W,Y).