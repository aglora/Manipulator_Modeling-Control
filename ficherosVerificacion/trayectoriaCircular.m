% -------------------------------------------------
% APARTADO A5 - Trayectoria circular en cartesianas
% -------------------------------------------------

function [x,y,z,q1,q2,q3] = trayectoriaCircular
  
  % Desarrolle aquí el código necesario para calcular una trayectoria 
  % circular en cartesianas, cuyos valores deberá guardar en los vectores x,y,z
  % así como las correspondiente coordenadas articulares q1,q2,q3.
  % El código será tal que para cualquier componente i de los vectores
  
  N=72; %Numero de puntos de la trayectoria
  
  x=zeros(1,N);
  y=zeros(1,N);
  z=zeros(1,N);
  q1=zeros(1,N);
  q2=zeros(1,N);
  q3=zeros(1,N);
  
  H=0; %altura a la que se da la trayectoria en el eje z
  R=1.5; %Radio de la trayectoria
  alpha=0:2*pi/(N-1):2*pi; %Ángulo barrido en la trayectoria circular
 
  for i=1:N
    x(i)=R*cos(alpha(i));
    y(i)=R*sin(alpha(i));
    z(i)=H;
    q=CinematicaInversa([x(i),y(i),z(i)]);
    q1(i)=q(1,1);
    q2(i)=q(2,1);
    q3(i)=q(3,1);
  end

  end



  