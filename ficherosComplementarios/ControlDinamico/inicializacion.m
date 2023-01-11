% Inicialización Generacion trayectorias

xyzInicial =[1.5  0.5  2.5];  % Punto inicial de la trayectoria en cartesianas 
xyzFinal   =xyzInicial+ [-0.15  -0.15  0.15]; % Punto final de la trayectoria en cartesianas 
[aux,okSol] = CinematicaInversa(xyzInicial);
if okSol
    qInicial = aux(:,1);
else
    disp('ERROR: El punto inicial de la trayectoria no es alcanzable.')
end
