:- dynamic nota/3.


create_nota(Id, Titulo, Texto) :-
    assertz(nota(Id, Titulo, Texto)),
    writeln('Nota criada com sucesso.').


modify_nota(Id, NewTitulo, NewTexto) :-
    retract(nota(Id, _, _)),
    assertz(nota(Id, NewTitulo, NewTexto)),
    writeln('Nota modificada com sucesso.').


delete_nota(Id) :-
    (   retract(nota(Id, _, _))
    ->  writeln('Nota deletada com sucesso.')
    ;   writeln('Nenhuma nota encontrada com esse ID.')).

display_nota(Id) :-
    nota(Id, Titulo, Texto),
    format('Titulo: ~w\n', [Titulo]),
    format('Texto: ~w\n', [Texto]).
