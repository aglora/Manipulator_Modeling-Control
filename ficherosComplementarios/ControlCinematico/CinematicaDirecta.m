% -------------------------------------------------
% APARTADO A3 - Cinemática directa numérica 
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER DOS VECTORES NUMÉRICOS, POSICIÓN Y ORIENTACIÓN,
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LAS TRES COORDENADAS ARTICULARES
% q1, q2 y q3

function [xyz,angEuler] = CinematicaDirecta(in)
  q1       = in(1);           % Posiciones articulares
  q2       = in(2);            
  q3       = in(3);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
  % SUSTITUYA los valores L0, L1, etc por sus valores numéricos  
  L0=1.5;L1=0.5;L2A=1;L2B=1;L3=0.5; % Valor de ejemplo. Sustitúyalo por el que corresponda
  
  % Posición del extremo de la articulación 3
  x = - L1*sin(q1) - L2B*cos(q1)*sin(q2) + cos(q1)*cos(q2)*(L3 + L2A + q3); % Ecuación de ejemplo. Cámbiela por su solución
  y = L1*cos(q1) - L2B*sin(q1)*sin(q2) + cos(q2)*sin(q1)*(L3 + L2A + q3); % Ecuación de ejemplo. Cámbiela por su solución
  z = L0 + L2B*cos(q2) + sin(q2)*(L3 + L2A + q3); % Ecuación de ejemplo. Cámbiela por su solución
  % Orientación (Ángulos de Euler) del marco de referencia 3
  RB3 = [cos(q1)*sin(q2), -sin(q1), cos(q1)*cos(q2);...
        sin(q1)*sin(q2),  cos(q1), cos(q2)*sin(q1);...
        -cos(q2),           0,          sin(q2)]; %Submatriz de rotación de MTH del efector final
  phi   = atan2(RB3(1,3),-RB3(2,3)); % Ecuación de ejemplo. Cámbiela por su solución
  theta = atan2(sqrt(1-(RB3(3,3))^2),RB3(3,3)); % Ecuación de ejemplo. Cámbiela por su solución
  psi   = atan2(RB3(3,1),RB3(3,2)); % Ecuación de ejemplo. Cámbiela por su solución
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  angEuler = [phi;theta;psi]; % Ángulos de Euler según convenio ZXZ
end