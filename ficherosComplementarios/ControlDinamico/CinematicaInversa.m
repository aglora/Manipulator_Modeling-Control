function [q,sol_OK]=Cinematica_Inversa(xyz)
x=xyz(1);
y=xyz(2);
z=xyz(3);

sol_OK=true; %Suponemos por defecto que el problema tiene solución
q=[];
% Longitudes
L0=1.5;
L1=0.5;
L2A=1;
L2B=1;
L3=0.5;

% Solución para q3 (2 soluciones)
q3a=sqrt(x^2+y^2+(z-L0)^2-L1^2-L2B^2)-L3-L2A;
q3b=-sqrt(x^2+y^2+(z-L0)^2-L1^2-L2B^2)-L3-L2A;

% Solución para q2 (2 soluciones para cada solución de q3)
    %Solución tomando q3a --> q2aa y q2ab
    A=L3+L2A+q3a;
    B=L2B;
    C=z-L0;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);
    if abs(C/R)>1
        q2aa=inf;
        q2ab=inf;
        sol_OK=false;
    else
        q2aa=atan2(C/R,sqrt(1-(C/R)^2))-phi; 
        q2ab=atan2(C/R,-sqrt(1-(C/R)^2))-phi;
    end  
    %Solución tomando q3b --> q2ba y q2bb
    A=L3+L2A+q3b;
    B=L2B;
    C=z-L0;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);
    if abs(C/R)>1
        q2ba=inf;
        q2bb=inf;
        sol_OK=false;
    else
        q2ba=atan2(C/R,sqrt(1-(C/R)^2))-phi;
        q2bb=atan2(C/R,-sqrt(1-(C/R)^2))-phi;
    end  

% Solución para q1 (2 soluciones para cada una de las 4 combinaciones de soluciones de q3 y q2)
    % La expresion de q1 no depende de q2 ni q3

    A=x;
    B=-y;
    C=-L1;
    R=sqrt(A^2+B^2);
    phi=atan2(B,A);
    if abs(C/R)>1
        q1a=inf;
        q1b=inf;
        sol_OK=false;
    else
        q1a=atan2(C/R,sqrt(1-(C/R)^2))-phi; 
        q1b=atan2(C/R,-sqrt(1-(C/R)^2))-phi;
    end  

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

%NOTA: SI ALGUNA DE LAS SOLUCIONES NO ES VÁLIDA LA COLUMNA EN CUESTIÓN
%CONTIENE ALGUNA COMPONENTE INF