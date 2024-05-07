:- dynamic caderno/3.


create_caderno(Id, Titulo, NotaIds) :-
    assertz(caderno(Id, Titulo, NotaIds)),
    writeln('Caderno criado com sucesso.').

delete_caderno(Id) :-
    retract(caderno(Id, _, _)),
    writeln('Caderno deletado com sucesso.').

modify_caderno(Id, NewTitulo, NewNotaIds) :-
    retract(caderno(Id, _, _)),
    assertz(caderno(Id, NewTitulo, NewNotaIds)),
    writeln('Caderno modificado com sucesso.').

display_caderno(Id) :-
    caderno(Id, Titulo, NotaIds),
    writeln('Caderno: ' + Titulo),
    maplist(display_nota, NotaIds).
