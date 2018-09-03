true(sim).
true(homem).

sintoma :-
    write('O paciente sente algum dos seguintes sintomas?'), nl,
    write('Sintomas: Fraqueza, Tonturas, Desmaios, Taquicardia, Palidez, Palpita��es,Icter�cia.'), nl,
    write('Responda: sim ou n�o'), nl,
    %Lendo resposta
    read(INPUT),
    %Definindo a variavel sintoma
    true(INPUT).
		
masculino :-
    write('Qual o sexo do paciente?'), nl,
    write('Responda: homem ou mulher'), nl,
    %Lendo resposta
    read(MASC),
    %Verificando se � homem, caso n�o seja, � mulher
	true(MASC).

hemoglobinabaixahomem :-
    %Verificando se o percentual est� abaixo do aceit�vel para homens.
    write('Qual a quantidade de hemoglobina do paciente (em g/L)?'),nl,
    read(HEMOH), HEMOH < 140.
    
hemoglobinabaixamulher :-
    %Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual a quantidade de hemoglobina do paciente (em g/L)?'),nl,
    read(HEMOM), HEMOM < 120.

hematocritosbaixohomem :-
	%Verificando se o percentual est� abaixo do aceit�vel para homens.
    write('Qual o percentual do n�vel de hemat�critos do paciente?'),nl,
    read(HETOH), HETOH < 42.
	
hematocritosbaixomulher :-
	%Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual o percentual do n�vel de hemat�critos do paciente?'),nl,
    read(HETOM), HETOM < 35.
	
hemaciasbaixahomem :-
	%Verificando se o percentual est� abaixo do aceit�vel para homens.
    write('Qual a quantidade de hemacias do paciente (10^6/mm�)?'),nl,
    read(HEMAH), HEMAH < 4.3.
	
hemaciasbaixamulher :-
	%Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual a quantidade de hemacias do paciente?'),nl,
    read(HEMAM), HEMAM < 3.5.

ferritinabaixa :-
	%Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual a quantidade de ferritina do paciente (em mcg/dl)?'),nl,
    read(FERRI), FERRI < 10.
b9baixa :-
	%Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual a quantidade de b9 do paciente (em ng/mL)?'),nl,
    read(B9), B9 < 2.7.
b6baixa :-
	%Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual a quantidade de b6 do paciente (em ng/mL)?'),nl,
    read(B6), B6 < 8.7.
b12baixa :-
	%Verificando se o percentual est� abaixo do aceit�vel para mulheres.
    write('Qual a quantidade de b12 do paciente (em pg/mL)?'),nl,
    read(B12), B12 < 200.

eletroforese :-
    %O diagn�stico � feito pela eletroforese de hemoglobina que detecta a presen�a da hemoglobina mutante (Hemoglobina S). 
	write('O exame de eletroforese de hemoglobina detectou a presen�a da hemoglobina mutante (Hemoglobina S)?'),nl,
	write('Responda: sim ou nao'),
	%Lendo resposta
    read(HEMOS),
    %definindo a variavel
    true(HEMOS).
	
testefragilidadecromossomica :-
	write('O teste de fragilidade cromoss�mica detectou alguma altera��o? Responda: sim ou nao'),nl,
	write('Responda: sim ou nao'),
	%Lendo resposta
    read(CROMO),
    %definindo a variavel
    true(CROMO).
%Verificando se a anemia � congenita.
historicocongenito :-

    write('O paciente apresenta evid�ncias de icter�cia?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evid�ncias de c�lculos biliares?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evid�ncias de esfenomegalia?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evid�ncias de hepatomegalia?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evid�ncias de malforma��es �sseas?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evid�ncias de retardo mental?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA).

%Verificando se existe um determinante hemol�tico cong�nito
determinantecongenito :-
    write('Existem resultados laboratoriais que apontam microcitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('Existem resultados laboratoriais que apontam eliptocitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('Existem resultados laboratoriais que apontam esferocitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('Existem resultados laboratoriais que apontam anisopoikilocitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente tem anemia relacionada � comida?'), nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA).	

%Verificando se o paciente tem de anemia.
anemia :-
	masculino -> anemiahomem; 
	anemiamulher.

anemiahomem :-
    (sintoma,(
    hemoglobinabaixahomem;
    hematocritosbaixohomem;hemaciasbaixahomem)) ->
    write('O resultado do teste de anemia para o paciente foi positivo. Seguindo com a verifica��o de subtipo...'),nl, testesubtipo;
    write('O resultado do teste de anemia para o paciente foi negativo.'), false.	
anemiamulher :-
    (sintoma,(hemoglobinabaixamulher;
    hematocritosbaixomulher;hemaciasbaixamulher)) ->
    write('O resultado do teste de anemia para o paciente foi positivo. Seguindo com a verifica��o de subtipo...'),nl, testesubtipo;
    write('O resultado do teste de anemia para o paciente foi negativo.'), false.

%Verificando subtipo.
testesubtipo :-
	
    ferritinabaixa -> write('Resultado: positivo.'),nl,
    write('Diagn�stico: Anemia Ferropriva(Adquirida por defici�ncia de ferro).');
	
	b9baixa -> write('Resultado: positivo.'),nl,
    write('Diagn�stico: Anemia Megalobl�stica(Adquirida por defici�ncia de vitamina B9).');
	
	b6baixa -> write('Resultado: positivo.'),nl,
    write('Diagn�stico: Anemia Siderobl�stica(Adquirida por defici�ncia de vitamina B6).');
	
	b12baixa -> write('Resultado: positivo.'),nl,
    write('Diagn�stico: Anemia Perniciosa(Adquirida por defici�ncia de vitamina B12).');
	
	(historicocongenito, determinantecongenito) -> testesubtipocongenita;
	
	write('Resultado: Desconhecido.'),nl,
    write('Diagn�stico: N�o foi poss�vel identificar o motivo da anemia.').

testesubtipocongenita :-	
	eletroforese -> write('Resultado: positivo.'),nl,
    write('Diagn�stico: Anemia Falseforme(Cong�nita).');
	
	testefragilidadecromossomica -> write('Resultado: positivo.'),nl,
    write('Diagn�stico: Anemia Falconi(Cong�nita).');
	
	write('Resultado: positivo.'),nl,
    write('Diagn�stico: anemia Apl�stica(Cong�nita).').
	
/*
testeinterface:- 
	new (Dialogo, dialog('Exame m�dico')),
	new (Etiqueta, label("Teste de Anemia ")),
	new (Texto1, text_item('Anemia � a defici�ncia no tamanho ou n�mero de hem�cias ou na quantidade de hemoglobina que elas cont�m. O que limita a troca de oxig�nio e di�xido de carbono entre o sangue e as c�lulas dos tecidos')),
	new (Texto2, text_item('O paciente senet algum desses sintomas?')),
	new (Texto3, text_item('Sintomas: Fraqueza, Tonturas, Desmaios, Taquicardia, Palidez, Palpita��es,Icter�cia.')),
	new(Botao1, button('Sair', message(Interface, destroy))),
	new(Botao2, button('Continuar', and(message(@prolog, anemia, Resposta?selection, Interface)))),
	
	
	
	send (Dialogo, append, Etiqueta),
	send (Dialogo, append, Texto1),
	send (Dialogo, append, Texto2),
	send (Dialogo, append, Texto3)
	send (Dialogo, append, Boton1),
	send (Dialogo, append, Boton2),
	send (Dialogo, open).
*/	
