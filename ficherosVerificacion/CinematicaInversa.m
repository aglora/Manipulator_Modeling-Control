% -------------------------------------------------
% APARTADO A4 - Cinem�tica Inversa num�rica
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCI�N DEBE DEVOLVER UN VECTOR/MATRIZ NUM�RICO q
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBI�N NUM�RICO CON LA POSICI�N EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACI�N 3, (x,y,z)
% EN CASO DE M�LTIPLES SOLUCIONES, EL RESULTADO SER� UNA MATRIZ q, DE MODO
% QUE CADA COLUMNA REPRESENTA UNA POSIBLE SOLUCI�N.

function [q,sol_OK]=CinematicaInversa(xyz)
x=xyz(1);
y=xyz(2);
z=xyz(3);

sol_OK=true; %Suponemos por defecto que el problema tiene soluci�n
sol_OK1=true;
sol_OK2=true;
q=[];

% Longitudes
L0=1.5;
L1=0.5;
L2A=1;
L2B=1;
L3=0.5;

% Soluci�n para q3 (2 soluciones)
if(x^2+y^2+(z-L0)^2-L1^2-L2B^2)>=0
    q3a=sqrt(x^2+y^2+(z-L0)^2-L1^2-L2B^2)-L3-L2A;
    q3b=-sqrt(x^2+y^2+(z-L0)^2-L1^2-L2B^2)-L3-L2A;
else
    sol_OK = false;
end

% Soluci�n para q2 (2 soluciones para cada soluci�n de q3)
    %Soluci�n tomando q3a --> q2aa y q2ab
if sol_OK
    A=L3+L2A+q3a;
    B=L2B;
    C=z-L0;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);
    if abs(C/R)<=1
        q2aa=atan2(C/R,sqrt(1-(C/R)^2))-phi; 
        q2ab=atan2(C/R,-sqrt(1-(C/R)^2))-phi;
    else
        sol_OK1=false;
    end  
    %Soluci�n tomando q3b --> q2ba y q2bb
    A=L3+L2A+q3b;
    B=L2B;
    C=z-L0;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);
    if abs(C/R)<=1
        q2ba=atan2(C/R,sqrt(1-(C/R)^2))-phi;
        q2bb=atan2(C/R,-sqrt(1-(C/R)^2))-phi;
    else
        q2ba=0;
        q2bb=0;
        sol_OK2=false;
    end  

    if (sol_OK1 == false && sol_OK2 ==false)
        sol_OK = false;
    end 
end
% Soluci�n para q1 (2 soluciones para cada combinacion de q2 y q3)
    % La expresion de q1 no depende de q2 ni q3

    A=x;
    B=-y;
    C=-L1;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);
    if abs(C/R)<=1
        q1a=atan2(C/R,sqrt(1-(C/R)^2))-phi; 
        q1b=atan2(C/R,-sqrt(1-(C/R)^2))-phi;
    else
        sol_OK=false;
    end  

if (sol_OK == false) %Ninguna soluci�n
    q=[0;0;0];

else %Todas las soluciones v�lidas
   
%Montamos matriz de soluciones
%     q= [  q1a  q1b  q1a   q1b   q1a   q1b   q1a   q1b;...
%           q2aa q2aa q2ab  q2ab  q2ba  q2ba  q2bb  q2bb;...
%           q3a  q3a  q3a   q3a   q3b   q3b   q3b   q3b];

 %Comprobamos las soluciones y 4 no son v�lidas
 %Suprimimos (Columnas 2,3,6 y 7)
 % Verdadera matriz de soluciones:
    q= [  q1a    q1b   q1a   q1b;...
          q2aa   q2ab  q2ba  q2bb;...
          q3a    q3a   q3b   q3b];

if (sol_OK1==false) && sol_OK %Quitamos soluciones que incluyen q2aa y q2ab
    q= [ q1a   q1b;...
        q2ba  q2bb;...
         q3b   q3b];
end

if (sol_OK2 == false) && sol_OK %Quitamos soluciones con q2ba y q2bb
    q= [  q1a    q1b  ;...
          q2aa   q2ab ;...
          q3a    q3a  ];
end

end

end