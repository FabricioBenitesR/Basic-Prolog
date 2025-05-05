% CONEXIONES CIUDADES
conexion(arad, zerind, 75).
conexion(arad, sibiu, 140).
conexion(arad, timisoara, 118).
conexion(zerind, oradea, 71).
conexion(oradea, sibiu, 151).
conexion(sibiu, rimnicu, 80).
conexion(sibiu, fagaras, 99).
conexion(rimnicu, pitesti, 97).
conexion(rimnicu, craiova, 146).
conexion(timisoara, lugoj, 111).
conexion(lugoj, mehadia, 70).
conexion(mehadia, dobreta, 75).
conexion(dobreta, craiova, 120).
conexion(craiova, pitesti, 138).
conexion(fagaras, bucarest, 211).
conexion(pitesti, bucarest, 101).
conexion(bucarest, giurgiu, 90).
conexion(bucarest, urziceni, 85).
conexion(urziceni, hirsova, 98).
conexion(hirsova, eforie, 86).
conexion(urziceni, vaslui, 142).
conexion(vaslui, iasi, 92).
conexion(iasi, neamt, 87).

camino(X, Y, D) :- conexion(X, Y, D).
camino(X, Y, D) :- conexion(Y, X, D).

ucs(Inicio, Meta, Ruta, Costo) :-
    ucs([[Inicio, 0, [Inicio]]], [], Meta, RutaReverso, Costo),
    reverse(RutaReverso, Ruta).

ucs([[Meta, Costo, Ruta]|_], _, Meta, Ruta, Costo).

ucs([[Actual, CostoActual, RutaActual]|RestoCola], Visitados, Meta, Ruta, CostoFinal) :-
    member(Actual, Visitados), !,
    ucs(RestoCola, Visitados, Meta, Ruta, CostoFinal).

ucs([[Actual, CostoActual, RutaActual]|RestoCola], Visitados, Meta, Ruta, CostoFinal) :-
    findall([Siguiente, NuevoCosto, [Siguiente|RutaActual]],
            (camino(Actual, Siguiente, CostoPaso),
             \+ member(Siguiente, RutaActual),
             NuevoCosto is CostoActual + CostoPaso),
            Sucesores),
    append(RestoCola, Sucesores, NuevaCola),
    sort(2, @=<, NuevaCola, ColaOrdenada),
    ucs(ColaOrdenada, [Actual|Visitados], Meta, Ruta, CostoFinal).

buscar :-
    write('Ciudad de inicio: '), read(Inicio),
    write('Ciudad destino: '), read(Meta),
    ucs(Inicio, Meta, Ruta, Costo),
    nl, write('Ruta optima: '), write(Ruta),
    nl, write('Costo total: '), write(Costo), nl.
