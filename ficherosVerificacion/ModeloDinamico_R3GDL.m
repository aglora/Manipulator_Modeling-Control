% -------------------------------------------------
% APARTADO B1 - Modelo dinámico inverso
% -------------------------------------------------

function [qdd] = ModeloDinamico_R3GDL(in)
% Variables de entrada en la funcion: [q(3)  qp(3)  Tau(3)]
q1        = in(1);
q2        = in(2);
q3        = in(3);
qd1       = in(4);
qd2       = in(5);
qd3       = in(6);
Tau1      = in(7);
Tau2      = in(8);
Tau3      = in(9);

% A rellenar por el alumno

Ma = [81.996*q3*cos(q2)^2 - 73.796*sin(2.0*q2) + 84.46*cos(q2)^2 - 32.798*q3*sin(2.0*q2) + 32.798*q3^2*cos(q2)^2 + 100.37, 32.798*cos(q2) + 69.696*sin(q2) + 16.399*q3*sin(q2), -16.399*cos(q2);...
        32.798*cos(q2) + 69.696*sin(q2) + 16.399*q3*sin(q2),                    32.798*q3^2 + 81.996*q3 + 196.23,         -32.798;...
         -16.399*cos(q2),                                             -32.798,          34.218];
 
Va = [0.08435*qd1 + 69.696*qd2^2*cos(q2) - 32.798*qd2^2*sin(q2) + 40.998*qd1*qd3 + 32.798*qd2*qd3*sin(q2) + 16.399*q3*qd2^2*cos(q2) + 32.798*q3*qd1*qd3 - 147.59*qd1*qd2*cos(2.0*q2) + 40.998*qd1*qd3*cos(2.0*q2) - 84.46*qd1*qd2*sin(2.0*q2) - 32.798*qd1*qd3*sin(2.0*q2) - 65.596*q3*qd1*qd2*cos(2.0*q2) + 32.798*q3*qd1*qd3*cos(2.0*q2) - 81.996*q3*qd1*qd2*sin(2.0*q2) - 32.798*q3^2*qd1*qd2*sin(2.0*q2);...
                                                   0.1038*qd2 + 81.996*qd2*qd3 + 73.796*qd1^2*cos(2.0*q2) + 42.23*qd1^2*sin(2.0*q2) + 32.798*q3*qd1^2*cos(2.0*q2) + 40.998*q3*qd1^2*sin(2.0*q2) + 16.399*q3^2*qd1^2*sin(2.0*q2) + 65.596*q3*qd2*qd3;...
                                                                                 0.048931*qd3 - 40.998*qd1^2*cos(q2)^2 - 32.798*q3*qd2^2 + 16.399*qd1^2*sin(2.0*q2) - 40.998*qd2^2 - 32.798*q3*qd1^2*cos(q2)^2];
 
g=9.81; %gravedad                                                                                 
Ga= [0; g*(139.39*cos(q2) - 65.596*sin(q2) + 32.798*q3*cos(q2)); 32.798*g*sin(q2)];

% Aceleraciones
  qdd = inv(Ma)*([Tau1;Tau2;Tau3]-Va-Ga);