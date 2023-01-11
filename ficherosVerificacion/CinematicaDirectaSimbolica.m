% -------------------------------------------------
% APARTADO A3 - Cinem�tica directa simb�lica 
% -------------------------------------------------

function [xyz] = CinematicaDirectaSimbolica
  
  % Emplee exclusivamente las siguientes variables simb�licas en sus expresiones
  syms x y z q1 q2 q3  real % variables articulares 
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Par�metros dimensionales
  PI = sym(pi);   % Emplee esta expresi�n de pi simb�lico

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS L�NEAS ----------
  % NO SUSTITUYA los valores L0, L1, etc por sus valores num�ricos
  % Posici�n del extremo de la articulaci�n 3
  x = - L1*sin(q1) - L2B*cos(q1)*sin(q2) + cos(q1)*cos(q2)*(L3 + L2A + q3); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  y = L1*cos(q1) - L2B*sin(q1)*sin(q2) + cos(q2)*sin(q1)*(L3 + L2A + q3); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  z = L0 + L2B*cos(q2) + sin(q2)*(L3 + L2A + q3); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  end



  