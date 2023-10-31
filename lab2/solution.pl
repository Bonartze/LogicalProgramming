proffession('mechanic').
proffession('chemist').
proffession('builder').
proffession('radioman').

better_in_chess(Win, Lose).
better_ski(Better, Worse).
younger(Young, Old).
theatre(More, Less).


solve([Borisov, Kirillov, Danin, Savin]):-
    proffession(P1),
    Borisov = proffession(P1),
    proffession(P2),
    P2 @< P1,
    Kirillov = proffession(P2),
    proffession(P3),
    P3 @< P1, P3 @< P2,
    Danin = proffession(P3),
    proffession(P4),
    P4 @< P3, P4 @< P2, P4 @< P1,    
    Savin = proffession(P4),
    better_in_chess(Borisov, Danin),
    better_in_chess(Savin, Borisov),
    better_ski(Borisov, X),
    younger(X, Borisov),
    theatre(Borisov, Y),
    younger(Kirillov, Y),
    theatre(proffession('chemist'), proffession('mechanic')),
    theatre(proffession('builder'), proffession('chemist')),
    younger(proffession('chemist'), _), younger(_, proffession('chemist')),
    better_ski(proffession('radioman'), proffession('builder')),
    better_in_chess(proffession('mechanic'), proffession('builder')),
    better_in_chess(younger(_, (proffession('chemist'); proffession('mechanic'); proffession('builder'); proffession('radioman'))), _),
    theatre(younger(_, proffession('chemist'); proffession('mechanic'); proffession('builder'); proffession('radioman')), _),
    better_ski(younger(proffession('chemist'); proffession('mechanic'); proffession('builder'); proffession('radioman'), _), _).