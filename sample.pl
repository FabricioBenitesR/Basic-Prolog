:- use_module(library(pce)).
:- use_module(library(pce_style_item)).

inicio :-
    new(Menu, dialog('Proyect SDM version Alienigena 1.3', size(1000, 800))),
    new(L, label(nombre, 'SISTEMA DE DIAGNOSTICO MEDICO')),
    new(A, label(nombre, 'hecho por Cristian Arreola 12041540')),
    new(@texto, label(nombre, 'responde un breve cuestionario para su diagnostico')),
    new(@respl, label(nombre, '')),
    new(Salir, button('SALIR', and(message(Menu, destroy), message(Menu, free)))),
    new(@boton, button('Realizar test', message(@prolog, iniciar_test))),

    send(Menu, append(L)),
    send(Menu, display, L, point(125, 20)),
    send(Menu, display, A, point(80, 360)),
    send(Menu, display, @boton, point(400, 400)), % Mover el botón "Realizar test"
    send(Menu, display, @texto, point(20, 100)),
    send(Menu, display, Salir, point(20, 400)),
    send(Menu, display, @respl, point(20, 130)),
    send(Menu, open_centered).

fallas('USTED PADECE PAPERAS:
TRATAMIENTO:
Aplicar compresas frías o calientes en la zona del cuello.
Tomar paracetamol (Tylenol) para aliviar el dolor. (No le dé ácido acetilsalicílico
a los niños con una enfermedad viral debido al riesgo del síndrome de Reye).
Tomar líquidos adicionales.
Comer alimentos blandos.
Hacer gárgaras con agua tibia con sal.
') :- paperas, !.

fallas('USTED PADECE VARICELA:
TRATAMIENTO:
Lociones para aliviar la picazón, paracetamol para la fiebre y el fármaco antivírico
aciclovir. El aciclovir reduce el número de días de fiebre de la varicela en niños
sin otra enfermedad.
') :- varicela, !.

fallas('USTED PADECE SARAMPION:
TRATAMIENTO:
El descanso y el aislamiento junto con el tratamiento de síntomas se pueden emprender
para permitir el paso del episodio lejos en sí mismo. Cremas hidratantes locales
de la piel se prescriben en caso de la erupción que pica.
') :- sarampion, !.

fallas('USTED PADECE ANEMIA:
TRATAMIENTO:
Tratamiento para detener el sangrado. Si la pérdida de sangre está causando
anemia por deficiencia de hierro, el tratamiento dependerá de la causa del sangrado.
Por ejemplo, si usted tiene una úlcera sangrante,
el médico puede recetarle antibióticos y otras medicinas para tratar la úlcera.
') :- anemia, !.

fallas('USTED PADECE RESFRIADO:
TRATAMIENTO:
El tratamiento de los síntomas no hará desaparecer el resfriado,
pero le ayudará a sentirse mejor.
Los antibióticos casi nunca se necesitan para tratar un resfriado común.
El paracetamol (Tylenol) y el ibuprofeno (Advil, Motrin) ayudan a disminuir
la fiebre y aliviar los dolores musculares.
') :- resfriado, !.

fallas('USTED PADECE INFLUENZA:
TRATAMIENTO:
Se recomiendan tres medicamentos antivirales para la influenza aprobados por
la Administración de Alimentos y Medicamentos de EE. UU. (FDA) para usar en
los Estados Unidos durante la temporada de influenza 2015-2016: oseltamivir
(Tamiflu®) por vía oral, zanamivir (Relenza®) para inhalar y peramivir
(Rapivab®) por vía intravenosa. Estos medicamentos son antivirales químicamente
relacionados, conocidos como inhibidores de neuraminidasa que actúan contra los
virus de la influenza A y B.
') :- influenza, !.

fallas('USTED PADECE HEPATITIS B:
TRATAMIENTO:
Actualmente disponemos del interferón alfa en forma pegilada denominada Peg-IFN,
fármaco que estimula la inmunidad y que actúa sobre el sistema inmunológico para
que este elimine las células hepáticas infectadas. También podemos utilizar dos
tipos de sustancias antivirales: los análogos de los nucleósidos a los que
pertenecen lamivudina, telbivudina y entecavir y los análogos del nucleótidos
como son adefovir y tenofovir.
') :- hepatitisb, !.

fallas('USTED PADECE HEPATITIS C:
TRATAMIENTO:
El tratamiento de la hepatitis C se basa en medicamentos antivirales.
El tratamiento indicado es la combinación de dos medicamentos,
el interferón alfa y la ribavirina y, actualmente, se emplea una nueva
formulación del interferón alfa, el interferón alfa pegilado,
cuya eficacia en combinación con ribavirina es aún mayor.
') :- hepatitisc, !.

fallas('Sin resultados, usted no dio la información necesaria o suficiente.
ERROR p560c4!').

paperas :- spaperas,
    pregunta('¿Tienes fiebre?'),
    pregunta('¿Tienes pérdida de apetito?'),
    pregunta('¿Tienes dolor de oído?'),
    pregunta('¿Tienes dificultad para hablar?'),
    pregunta('¿Tienes dificultad para masticar?'),
    pregunta('¿Tienes dolor de cabeza?').

varicela :- svaricela,
    pregunta('¿Tienes fiebre?'),
    pregunta('¿Tienes dolor de cabeza?'),
    pregunta('¿Tienes cansancio?'),
    pregunta('¿Tienes pérdida de apetito?').

sarampion :- ssarampion,
    pregunta('¿Tienes tos?'),
    pregunta('¿Tienes moqueo?'),
    pregunta('¿Tienes puntos blancos en la boca?'),
    pregunta('¿Tienes fiebre?').

anemia :- sanemia,
    pregunta('¿Tienes dolor de cabeza?'),
    pregunta('¿Tienes palidez?'),
    pregunta('¿Tienes dolor en pecho?'),
    pregunta('¿Tienes frío en manos y pies?'),
    pregunta('¿Tienes mareo?').

resfriado :- sresfriado,
    pregunta('¿Tienes dolor de garganta?'),
    pregunta('¿Tienes escalofríos?'),
    pregunta('¿Tienes fiebre?'),
    pregunta('¿Tienes dificultad para tragar?'),
    pregunta('¿Tienes cansancio?').

influenza :- sinfluenza,
    pregunta('¿Tienes fiebre?'),
    pregunta('¿Tienes escalofríos?'),
    pregunta('¿Tienes tos?'),
    pregunta('¿Tienes dolor de garganta?'),
    pregunta('¿Tienes moqueo?'),
    pregunta('¿Tienes dolor muscular?'),
    pregunta('¿Tienes diarrea?').

hepatitisb :- shepatitisb,
    pregunta('¿Tienes coloración amarillenta?'),
    pregunta('¿Tienes orina oscura?'),
    pregunta('¿Tienes cansancio?'),
    pregunta('¿Tienes vómito?'),
    pregunta('¿Tienes dolor abdominal?'),
    pregunta('¿Tienes diarrea?').

hepatitisc :- shepatitisc,
    pregunta('¿Tienes cansancio?'),
    pregunta('¿Tienes coloración amarillenta?'),
    pregunta('¿Tienes pérdida de apetito?'),
    pregunta('¿Tienes heces blanquecinas?'),
    pregunta('¿Tienes picores generalizados?'),
    pregunta('¿Tienes alteraciones en coagulación?'),
    pregunta('¿Tienes hinchazón en piernas y abdomen?'),
    pregunta('¿Tienes orina oscura?').

spaperas :- pregunta('¿Malestar general?'), !.
svaricela :- pregunta('¿Tienes erupciones en la piel?'), !.
ssarampion :- pregunta('¿Tienes ojos llorosos?'), !.
sanemia :- pregunta('¿Tienes dificultad para respirar?'), !.
sresfriado :- pregunta('¿Área blanca o grisácea en parte posterior de garganta?'), !.
sinfluenza :- pregunta('¿Tienes dolor muscular?'), !.
shepatitisb :- pregunta('¿Tienes náuseas?'), !.
shepatitisc :- pregunta('¿Tienes hematomas?'), !.

:- dynamic si/1, no/1.

preguntar(Problema) :-
    new(Di, dialog('Diagnostico medico')),
    new(L2, label(texto, 'Responde las siguientes preguntas')),
    new(La, label(prob, Problema)),
    new(B1, button(si, and(message(Di, return, si)))),
    new(B2, button(no, and(message(Di, return, no)))),

    send(Di, append(L2)),
    send(Di, append(La)),
    send(Di, append(B1)),
    send(Di, append(B2)),

    send(Di, default_button, si),
    send(Di, open_centered),
    get(Di, confirm, Answer),
    write(Answer),
    nl,
    send(Di, destroy),
    ((Answer == si) -> assert(si(Problema)); assert(no(Problema)), fail).

pregunta(S) :- (si(S) -> true; (no(S) -> fail; preguntar(S))).

limpiar :- retract(si(_)), fail.
limpiar :- retract(no(_)), fail.
limpiar.

iniciar_test :-
    write('Botón presionado'), nl,
    limpiar,
    fallas(Falla),
    send(@texto, selection(' ')),
    send(@respl, selection(Falla)),
    write('Procedimiento completado'), nl,
    limpiar.

lim :- send(@respl, selection('')).
