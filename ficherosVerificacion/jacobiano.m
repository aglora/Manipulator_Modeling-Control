% -------------------------------------------------
% APARTADO A6 - Jacobianos
% -------------------------------------------------

function [Jdir,Jinv] = jacobiano
  % Desarrolle aqu� el c�digo necesario para determinar los Jacobianos 
  % directo (Jdir) e inverso (Jinv)
  % El c�lculo se realizar� de modo exclusivamente simb�lico

% Definici�n de variables simb�licas  
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms x y z q1 q2 q3 real  
PI = sym(pi); % use PI (en may�sculas) para referirse a pi.
  
%Ecuaciones obtenidas de la Cinem�tica Directa
px = - L1*sin(q1) - L2B*cos(q1)*sin(q2) + cos(q1)*cos(q2)*(L3 + L2A + q3);
py = L1*cos(q1) - L2B*sin(q1)*sin(q2) + cos(q2)*sin(q1)*(L3 + L2A + q3);
pz = L0 + L2B*cos(q2) + sin(q2)*(L3 + L2A + q3);

% Jacobiano directo  
Jdir = simplify([diff(px,q1),diff(px,q2),diff(px,q3);...
                 diff(py,q1),diff(py,q2),diff(py,q3);...
                 diff(pz,q1),diff(pz,q2),diff(pz,q3)]); % C�mbielo por su soluci�n
% Jacobiano inverso  
Jinv = simplify(inv(Jdir));

end



  