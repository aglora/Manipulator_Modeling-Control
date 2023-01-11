% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa simbólica
% -------------------------------------------------

function q = CinematicaInversaSimbolica
  
  % Emplee exclusivamente las siguientes variables simbólicas en sus expresiones
  syms x y z q1 q2 q3  real % Coordenadas cartesianas del efector final
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Parámetros dimensionales
  % Emplee esta expresión de pi simbólico
  PI = sym(pi);

% Solución para q3 (2 soluciones)
    q3a=simplify(sqrt(x^2+y^2+(z-L0)^2-L1^2-L2B^2)-L3-L2A);
    q3b=simplify(-sqrt(x^2+y^2+(z-L0)^2-L1^2-L2B^2)-L3-L2A);

% Solución para q2 (2 soluciones para cada solución de q3)
    %Solución tomando q3a --> q2aa y q2ab
    A=L3+L2A+q3a;
    B=L2B;
    C=z-L0;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);

    q2aa=simplify(atan2(C/R,sqrt(1-(C/R)^2))-phi); 
    q2ab=simplify(atan2(C/R,-sqrt(1-(C/R)^2))-phi);

    %Solución tomando q3b --> q2ba y q2bb
    A=L3+L2A+q3b;
    B=L2B;
    C=z-L0;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);

    q2ba=simplify(atan2(C/R,sqrt(1-(C/R)^2))-phi);
    q2bb=simplify(atan2(C/R,-sqrt(1-(C/R)^2))-phi);
 

% Solución para q1 (2 soluciones para cada combinación)
% La expresion de q1 no depende de q2 ni q3

    A=x;
    B=-y;
    C=-L1;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);

    q1a=simplify(atan2(C/R,sqrt(1-(C/R)^2))-phi); 
    q1b=simplify(atan2(C/R,-sqrt(1-(C/R)^2))-phi);


%Montamos matriz de soluciones
%     q= [  q1a  q1b  q1a   q1b   q1a   q1b   q1a   q1b;...
%           q2aa q2aa q2ab  q2ab  q2ba  q2ba  q2bb  q2bb;...
%           q3a  q3a  q3a   q3a   q3b   q3b   q3b   q3b];

 %Comprobamos las soluciones y 4 no son válidas
 %Suprimimos (Columnas 2,3,6 y 7)
 % Verdadera matriz de soluciones:
    q= [  q1a    q1b   q1a   q1b;...
          q2aa   q2ab  q2ba  q2bb;...
          q3a    q3a   q3b   q3b];
end



  