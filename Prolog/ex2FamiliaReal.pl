homem(philip).
homem(charles).
homem(mark_Philips).
homem(timothy).
homem(andrew).
homem(edward).
homem(peter_Philips).
homem(mike).
homem(willian).
homem(harry).
homem(jack).
homem(james).
homem(george).
homem(louis).

mulher(elizabeth_II).
mulher(diana).
mulher(camilla).
mulher(anne).
mulher(sarah).
mulher(sophie).
mulher(autumn_Philips).
mulher(zara).
mulher(catherine).
mulher(meghan).
mulher(beatrice).
mulher(eugenie).
mulher(louise).
mulher(charlotte).
mulher(archie).
mulher(savannah).
mulher(isla).
mulher(mia).
mulher(lena).

%queen tree
progen(elizabeth_II,charles).
progen(elizabeth_II,anne).
progen(elizabeth_II,andrew).
progen(elizabeth_II,edward).
progen(philip,charles).
progen(philip,anne).
progen(philip,andrew).
progen(philip,edward).
%charles tree
progen(charles,willian).
progen(charles,harry).
progen(diana,willian).
progen(diana,harry).
progen(willian,george).
progen(willian,charlotte).
progen(willian,louis).
progen(harry,archie).
%anne tree
progen(anne,peter_Philips).
progen(anne,zara).
progen(mark_Philips,peter_Philips).
progen(mark_Philips,zara).
progen(peter_Philips,savannah).
progen(peter_Philips,isla).
progen(autumn_Philips,savannah).
progen(autumn_Philips,isla).
progen(zara,mia).
progen(zara,lena).
progen(mike,mia).
progen(mike,lena).
%andrew tree
progen(andrew,beatrice).
progen(andrew,eugenie).
progen(sarah,beatrice).
progen(sarah,eugenie).
%edward tree
progen(edward,louise).
progen(edward,james).
progen(sophie,louise).
progen(sophie,james).

idade(philip,98).
idade(charles,70).
idade(mark_Philips,70).
idade(timothy,64).
idade(andrew,59).
idade(edward,55).
idade(peter_Philips,41).
idade(mike,40).
idade(willian,37).
idade(harry,34).
idade(jack,63).
idade(james,11).
idade(george,6).
idade(louis,1). 
idade(elizabeth_II,93).
idade(diana,36).
idade(camilla,72).
idade(anne,69).
idade(sarah,59).
idade(sophie,54).
idade(autumn_Philips,41).
idade(zara,38).
idade(catherine,37).
idade(meghan,38).
idade(beatrice,31).
idade(eugenie,59).
idade(louise,15).
idade(charlotte,4).
idade(archie,0).
idade(savannah,8).
idade(isla,7).
idade(mia,5).
idade(lena,0).

%busca pai e mae
pai(X,Y) :- progen(X,Y),homem(X).
mae(X,Y) :- progen(X,Y),mulher(X).

%busca filho(a)
filhoa(X,Y) :- progen(Y,X).

%busca neto(a)
netoa(X,Y) :- filhoa(X,Z),filhoa(Z,Y).

% 1) Qual a idade dos netos da rainha?
%consulta: netoa(X, elizabeth_II),idade(X,A).
idades_list([X|Y],Z) :- netoa(X,Z),idade(X,Y).


%2) Qual a idade médfia dos netos da rainha?
%soma idades
soma([],0).
soma([H|T],Z) :- soma(T,I),idade(H,Y), Z is Y+I.
%quantidade de pessoas
pessoas([],0).
pessoas([_|T],Z) :- pessoas(T,I), Z is 1+I.
%lista retorna média
media([],0]).
media(Y,Z):- findall(X, (netoa(X,Y)), A), soma(A, I), pessoas(A,T), Z is I / T.

%3 ncnovo(), precisa passar um vetor com os nomes dos netos de charles

min(A,B,R) :- A =< B, R is A.
min(A,B,R) :- B =< A, R is B.

comp(A,B,C,D,X,R) :- A =:= C, R = D; B =:= C, R = X.

ncnovo([Y], Y).
ncnovo([X|Y], T) :- ncnovo(Y, D), idade(D, A), idade(X, B), min(A,B,C), comp(A,B,C,D,X,T).

%4 familiareal(nome do decendente)

familiareal(A) :- pai(elizabeth, A); neto(elizabeth, A); bisneto(elizabeth, A).

%5 maisfilho(), precisa passar um vetor com os nomes de quem quer comparar

max(A,B,R) :- A >= B, R is A.
max(A,B,R) :- B >= A, R is B.

cont([], 0).
cont([_|Y], T) :- cont(Y, D), T is D + 1.

achafilho(A, B) :- findall(X, pai(A, X), C), cont(C, B).

maisfilho([Y], Y).
maisfilho([X|Y], A) :- maisfilho(Y, Z),achafilho(Z, B), achafilho(X, C), max(B,C,R), comp(B,C,R,Z,X,A).

%6 trono(filho, neto, bisneto) na ordem de sucessao

trono(X, Y, Z) :- pai(elizabeth, X), pai(X, Y), pai(Y, Z).

%7 Terceira geração são os filhos dos filhos dos filhos da rainha.
netoa(X,Y) :- filhoa(X,Z),filhoa(Z,Y).

%8 trono(filho, neto, bisneto) na ordem de sucessao se anne fosse a primogenita

tronoanne(X, Y, Z) :- pai(elizabeth, X), X \= charles, pai(X, Y), pai(Y, Z).