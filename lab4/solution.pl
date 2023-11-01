remove_(X,[X|T],T).
remove_(X,[Y|T],[Y|T1]):- remove_(X,T,T1).

person_list(['Даша','Света','Саша','Коля','Катя','Маша']).
verb_list(['любит','хочет','кушает','лежат']).
obj_list(['деньги','шоколад','фильмы','книги','мандарины']).

verb('любит','любить').
verb('хочет','хотеть').
verb('кушает','кушать').
verb('лежат','лежать','лежит').

v([X],Y):-
    verb_list(L),
    member(X,L),
    verb(X,Y).

    s1([X],object(X)):-
    obj_list(L),
    member(X,L).

    an_s2([X],agent(X)):-
    person_list(L),
    member(X,L).

an_q(L,(Y,X,Z)):-
member('Кто',L),
member('?',L),
remove_('?',L,NewL),
remove_('Кто',NewL,NewL2),
append(L1,L2,NewL2),
v(L1,Y),
s1(L2,Z),
X = agent('Y').

an_q(L,(Y,Z,X)):-
member('Что',L),
member('?',L),
remove_('?',L,NewL),
remove_('Что',NewL,NewL2),
append(L1,L2,NewL2),
v(L1,Y),
an_s2(L2,Z),
X = object('Y').

an_q(L,(Y,Z,X)):-
member('Где',L),
member('?',L),
remove_('?',L,NewL),
remove_('Где',NewL,NewL2),
append(L1,L2,NewL2),
v(L1,Y),
s1(L2,Z),
X = loc('Y').