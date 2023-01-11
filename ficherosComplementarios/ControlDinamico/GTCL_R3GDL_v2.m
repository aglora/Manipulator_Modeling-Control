function trayectoria = GTCL_R3GDL_v2(in)

numCISolution = 1;    
    
% Ecuaciones de un Generador de trayectorias Cartesiano Lineal para un robot de 2 gdl
% Recibe (X,Y,Z)ini , (X,Y,Z)fin, N (número de puntos intermedios entre punto inicial y final),
% T (tiempo de duración del movimiento), t_ini(tiempo de inicio del movimiento), y el tiempo.
%
% Devuelve las referencias de q1 y q2 para seguir el movimiento.
%
% Calcula N puntos intermedios (N definido dentro del programa)

% Configuración del Generador de Trayectorias

            % 0: Perfil de interpolación mediante polinomios de tercer orden

            % 0: Asignación de velocidades articulares intermedias por "método heurístico"

Xini       = in(1);           % Posición cartesiana inicial
Yini       = in(2);           % 
Zini       = in(3);           % 
Xfin       = in(4);           % Posición cartesiana final
Yfin       = in(5);           % 
Zfin       = in(6);           % 
N          = in(7);           % Número de puntos intermedios
t_ini      = in(8);           % Tiempo de inicio del movimiento
T          = in(9);           % Duración del movimiento
t          = in(10);           % Reloj


    if (N<0); N=0; end;
    Xint = zeros(1,N+2);
    Yint = zeros(1,N+2);
    Zint = zeros(1,N+2);
    q1int = zeros(1,N+2);
    q2int = zeros(1,N+2);
    q3int = zeros(1,N+2);
    qp1int = zeros(1,N+2);
    qp2int = zeros(1,N+2);
    qp3int = zeros(1,N+2);
    
    
    % Asignación de coordenadas iniciales y finales
    Xint(1)   = Xini;   Yint(1)   = Yini;   Zint(1)   = Zini;
    Xint(N+2) = Xfin;   Yint(N+2) = Yfin;   Zint(N+2) = Zfin;   

    incT = T/(N+1);    
       
    % Cálculo de las coordenadas cartesianas de los puntos intermedios
    if (N>0)
        for ind=1:N;
            Xint(ind+1) = Xini+(Xfin-Xini)/(N+1)*ind;
            Yint(ind+1) = Yini+(Yfin-Yini)/(N+1)*ind;
            Zint(ind+1) = Zini+(Zfin-Zini)/(N+1)*ind;
        end
    end

    % Cálculo de las coordenadas articulares de todos los puntos 
    for ind=1:N+2;
        %qint =  CinematicaInversa_DNI([Xint(ind); Yint(ind); Zint(ind); DNI]);
        %[qaux,Flag_FueraRango]=cinInvProof([Xint(ind); Yint(ind); Zint(ind)]);
        [qaux,okSOl]=CinematicaInversa([Xint(ind); Yint(ind); Zint(ind)]);
        Flag_FueraRango = 1-okSOl;
        qint =  qaux(:,numCISolution);
        q1int(ind)=qint(1); q2int(ind)=qint(2); q3int(ind)=qint(3);
        %Flag_FueraRango=qint(4);
        if (Flag_FueraRango == 1)
                trayectoria =  [0; 0; 0; 0; 0; 0; 0; 0; 0 ; Flag_FueraRango];
            return;
        end
    end



%  DETECCIÓN DEL TRAMO EN FUNCIÓN DEL TIEMPO
%  (hay N+3 tramos, ya que hay N+2 puntos)
%
%  Tramo 0: antes de iniciar el movimiento (robot está en posición inicial)
%  Tramo 1: Primer tramo de movimiento
%  Tramo 2: Segundo tramo de movimiento
%  ...
%  Tramo N+1: Último tramo del movimiento
%  Tramo N+2: Tramo en el que el robot está en la posición final

if (t<= t_ini) 
    tramo=0;
    q1=q1int(1); q2=q2int(1); q3=q3int(1);
    qp1=0; qp2=0; qp3=0;
    qpp1=0; qpp2=0; qpp3=0;

    trayectoria =  [q1; q2; q3; qp1; qp2; qp3; qpp1; qpp2; qpp3; Flag_FueraRango];
    return;
end

if (t>= t_ini+T)
    tramo=N+2;
    q1=q1int(N+2); q2=q2int(N+2); q3=q3int(N+2);
    qp1=0; qp2=0; qp3=0;
    qpp1=0; qpp2=0; qpp3=0;

    trayectoria =  [q1; q2; q3; qp1; qp2; qp3; qpp1; qpp2; qpp3; Flag_FueraRango];
    return;
end

    tramo=0;
    while ((t-t_ini)>(tramo*incT))
        tramo=tramo+1;
    end
    t_tramo = (t-t_ini-(tramo-1)*incT);  % tiempo que lleva la trayectoria dentro del tramo


         
    % INTERPORLACIÓN MEDIANTE POLINOMIOS DE TERCER ORDEN
            

            
        % Cálculo de las velocidades de paso de todos los puntos mediante el
        % método heurístico
        qp1int(1)=0;
        qp1int(N+2)=0;
        qp2int(1)=0;
        qp2int(N+2)=0;
        qp3int(1)=0;
        qp3int(N+2)=0;

        for ind=2:N+1;
            if (sign(q1int(ind)-q1int(ind-1))~= sign(q1int(ind+1)-q1int(ind)) );
                qp1int(ind) = 0;
            else
                qp1int(ind) = 0.5*(q1int(ind+1)-q1int(ind-1))/incT;
            end
            if (sign(q2int(ind)-q2int(ind-1))~= sign(q2int(ind+1)-q2int(ind)) );
                qp2int(ind) = 0;
            else
                qp2int(ind) = 0.5*(q2int(ind+1)-q2int(ind-1))/incT; 
            end
            if (sign(q3int(ind)-q3int(ind-1))~= sign(q3int(ind+1)-q3int(ind)) );
                qp3int(ind) = 0;
            else
                qp3int(ind) = 0.5*(q3int(ind+1)-q3int(ind-1))/incT; 
            end
    
        end
    
    % Cálculo de los coeficientes de los polinomios en función de las
    % condiciones de contorno del tramo
    a1 = q1int(tramo);
    b1 = qp1int(tramo);
    c1 = 3/incT^2*(q1int(tramo+1)-q1int(tramo))-1/incT*(qp1int(tramo+1)+2*qp1int(tramo));
    d1 = -2/incT^3*(q1int(tramo+1)-q1int(tramo))+1/incT^2*(qp1int(tramo+1)+qp1int(tramo));

    a2 = q2int(tramo);
    b2 = qp2int(tramo);
    c2 = 3/incT^2*(q2int(tramo+1)-q2int(tramo))-1/incT*(qp2int(tramo+1)+2*qp2int(tramo));
    d2 = -2/incT^3*(q2int(tramo+1)-q2int(tramo))+1/incT^2*(qp2int(tramo+1)+qp2int(tramo));

    a3 = q3int(tramo);
    b3 = qp3int(tramo);
    c3 = 3/incT^2*(q3int(tramo+1)-q3int(tramo))-1/incT*(qp3int(tramo+1)+2*qp3int(tramo));
    d3 = -2/incT^3*(q3int(tramo+1)-q3int(tramo))+1/incT^2*(qp3int(tramo+1)+qp3int(tramo));

    q1=a1+b1*t_tramo+c1*t_tramo^2+d1*t_tramo^3;
    q2=a2+b2*t_tramo+c2*t_tramo^2+d2*t_tramo^3;
    q3=a3+b3*t_tramo+c3*t_tramo^2+d3*t_tramo^3;

    qp1=b1+2*c1*t_tramo+3*d1*t_tramo^2;
    qp2=b2+2*c2*t_tramo+3*d2*t_tramo^2;
    qp3=b3+2*c3*t_tramo+3*d3*t_tramo^2;

    qpp1=2*c1+6*d1*t_tramo;
    qpp2=2*c2+6*d2*t_tramo;
    qpp3=2*c3+6*d3*t_tramo;

    % FIN DE INTERPORLACIÓN MEDIANTE POLINOMIOS DE TERCER ORDEN
trayectoria =  [q1; q2; q3; qp1; qp2; qp3; qpp1; qpp2; qpp3; Flag_FueraRango];


return;
