:- [notas, cadernos].

start :-
    writeln('Sistema de Notas e Cadernos iniciado.'),
    menu.

menu :-
    writeln('Escolha uma opção:'),
    writeln('1- Gerenciar notas'),
    writeln('2- Gerenciar cadernos'),
    writeln('3- Sair'),
    read_line_to_string(user_input, Input),
    number_string(Choice, Input),
    execute_choice(Choice).
    
execute_choice(1) :-
    writeln('Gerenciando notas...'),
    notas_menu.
execute_choice(2) :-
    writeln('Gerenciando cadernos...'),
    cadernos_menu.
execute_choice(3) :-
    writeln('Saindo...'),
    halt.
execute_choice(_) :-
    writeln('Opção inválida, tente novamente.'),
    menu.

notas_menu :-
    writeln('Escolha uma ação para as notas:'),
    writeln('1- Criar nota'),
    writeln('2- Modificar nota'),
    writeln('3- Deletar nota'),
    writeln('4- Exibir nota'),
    writeln('5- Retornar ao menu principal'),
    read_line_to_string(user_input, Input),
    number_string(Choice, Input),
    execute_nota_choice(Choice).
    
execute_nota_choice(1) :-
    writeln('Insira o ID da nota (número inteiro):'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    writeln('Insira o Título da nota:'),
    read_line_to_string(user_input, Titulo),
    writeln('Insira o Texto da nota:'),
    read_line_to_string(user_input, Texto),
    create_nota(Id, Titulo, Texto),
    notas_menu.
    
execute_nota_choice(2) :-
    writeln('Insira o ID da nota a ser modificada:'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    writeln('Insira o novo título da nota:'),
    read_line_to_string(user_input, NewTitulo),
    writeln('Insira o novo texto da nota:'),
    read_line_to_string(user_input, NewTexto),
    modify_nota(Id, NewTitulo, NewTexto),
    notas_menu.
execute_nota_choice(3) :-
    writeln('Insira ID da nota a ser deletada:'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    delete_nota(Id),
    notas_menu.
execute_nota_choice(4) :-
    writeln('Insira ID da nota a ser exibida:'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    display_nota(Id),
    notas_menu.
execute_nota_choice(5) :-
    menu.
execute_nota_choice(_) :-
    writeln('Opção inválida, tente novamente.'),
    notas_menu.


cadernos_menu :-
    writeln('Escolha uma ação para os cadernos:'),
    writeln('1- Criar caderno'),
    writeln('2- Modificar caderno'),
    writeln('3- Deletar caderno'),
    writeln('4- Exibir caderno'),
    writeln('5- Retornar ao menu principal'),
    read_line_to_string(user_input, Input),
    number_string(Choice, Input),
    execute_caderno_choice(Choice).
    
execute_caderno_choice(1) :-
    writeln('Insira o ID do caderno (número inteiro):'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    writeln('Insira o Título do caderno:'),
    read_line_to_string(user_input, Titulo),
    writeln('Insira os IDs das notas associadas (lista de números):'),
    read_line_to_string(user_input, NotaIdsStr),
    split_string(NotaIdsStr, " ", "", StrIds),
    maplist(number_string, NotaIds, StrIds),
    create_caderno(Id, Titulo, NotaIds),
    cadernos_menu.
    
execute_caderno_choice(2) :-
    writeln('Insira o ID do caderno a ser modificado:'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    writeln('Insira o novo título do caderno:'),
    read_line_to_string(user_input, NewTitulo),
    writeln('Insira os novos IDs das notas associadas (lista de números):'),
    read_line_to_string(user_input, NewNotaIdsStr),
    split_string(NewNotaIdsStr, " ", "", NewStrIds),
    maplist(number_string, NewNotaIds, NewStrIds),
    modify_caderno(Id, NewTitulo, NewNotaIds),
    cadernos_menu.
    
execute_caderno_choice(3) :-
    writeln('Insira o ID do caderno a ser deletado:'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    delete_caderno(Id),
    cadernos_menu.
    
execute_caderno_choice(4) :-
    writeln('Insira o ID do caderno a ser exibido:'),
    read_line_to_string(user_input, IdStr),
    number_string(Id, IdStr),
    display_caderno(Id),
    cadernos_menu.
    
execute_caderno_choice(5) :-
    menu.
    
execute_caderno_choice(_) :-
    writeln('Opção inválida, tente novamente.'),
    cadernos_menu.
