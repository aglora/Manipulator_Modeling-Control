% -------------------------------------------------
% APARTADO B1 - Parámetros dinámicos
% -------------------------------------------------

function [s11,s22,s33,I11,I22,I33] = parametrosDinamicos
% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
% Consigne datos numéricos, no simbólicos
L0=1.5;L1=0.5;L2A=1;L2B=1;L3=0.5; %longitudes de las barras (m)
m0=98.3947;m1=32.7982;m2=131.193;m3=32.7982; %masas de las barras (kg)
Rint=0.08; %radio interior cilindros barras (m)
Rext=0.1; %radio exterior cilindros barras (m)
  
% Eslabón 1
  s11 = [0 ,0  ,-L1/2 ]'; % (m)  Posición del cdg del eslabón 1
  
  Ixx1=(m1*L1^2)/12;
  Iyy1=(m1*L1^2)/12;
  Izz1=(m1*(Rext^2 + Rint^2))/2;

  I11=[ Ixx1,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 1
        0,  Iyy1,  0;...
        0,  0,  Izz1 ] ; 

% Eslabón 2
  Pcdg_2A = [L2B,0,L2A/2]; %Posición del cdg del elabón 2A
  Pcdg_2B = [L2B/2,0,L2A]; %Posición del cdg del elabón 2B
  s22=(Pcdg_2A+Pcdg_2B)'/2; % (m)  Posición del cdg del eslabón 2
  
  m2A=m2/2; %masa del eslabón 2A
  m2B=m2/2; %masa del eslabón 2B
  
  Ixx2A=(m2A*L2A^2)/12;
  Iyy2A=(m2A*L2A^2)/12;
  Izz2A=(m2A*(Rext^2 + Rint^2))/2;
  I2A=[ Ixx2A,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 2A en cdg 2A
        0,  Iyy2A,  0;...
        0,  0,  Izz2A ] ; 
  
  Ixx2B=(m2B*(Rext^2 + Rint^2))/2;
  Iyy2B=(m2B*L2B^2)/12;
  Izz2B=(m2B*L2B^2)/12;
  I2B=[ Ixx2B,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 2B en cdg 2B
        0,  Iyy2B,  0;...
        0,  0,  Izz2B ] ; 
  
  Da=[s22(1)-Pcdg_2A(1);s22(2)-Pcdg_2A(2);s22(3)-Pcdg_2A(3)]; %distancia del cdg 2A al cdg 2
  Db=[s22(1)-Pcdg_2B(1);s22(2)-Pcdg_2B(2);s22(3)-Pcdg_2B(3)]; %distancia del cdg 2B al cdg 2
  
  MDa=[Da(2)^2+Da(3)^2 , -Da(1)*Da(2) , -Da(1)*Da(3);...
        -Da(1)*Da(2) , Da(1)^2+Da(3)^2 , -Da(2)*Da(3);...
        -Da(1)*Da(3)    , -Da(2)*Da(3) ,  Da(1)^2+Da(2)^2];% Matriz de distancias A para aplicar Steiner 
  
  MDb=[Db(2)^2+Db(3)^2 , -Db(1)*Db(2) , -Db(1)*Db(3);...
        -Db(1)*Db(2) , Db(1)^2+Db(3)^2 , -Db(2)*Db(3);...
        -Db(1)*Db(3)    , -Db(2)*Db(3) ,  Db(1)^2+Db(2)^2];% Matriz de distancias B para aplicar Steiner 

  %Teorema de Steiner
  I2A_cdg=I2A+m2A*MDa; % (kg.m2) Tensor de inercia del eslabón 2A en cdg 2
  I2B_cdg=I2B+m2B*MDb; % (kg.m2) Tensor de inercia del eslabón 2B en cdg 2

  I22=I2A_cdg+I2B_cdg; % (kg.m2) Tensor de inercia del eslabón 2

% Eslabón 3
  s33 = [0 ,0  ,-L3/2 ]'; % (m)  Posición del cdg del eslabón 3
  
  Ixx3=(m3*L3^2)/12;
  Iyy3=(m3*L3^2)/12;
  Izz3=(m3*(Rext^2 + Rint^2))/2;
  
  I33=[ Ixx3,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 3
        0,  Iyy3,  0;...
        0,  0,  Izz3 ] ; 
end