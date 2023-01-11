function [Tau_add] = Compensador(in)

% Variables de entrada en la funcion: [q(3)  qp(3)  qr(3) qddr(3) u(3)]
q1        = in(1);
q2        = in(2);
q3        = in(3);
qd1       = in(4);
qd2       = in(5);
qd3       = in(6);
qr1     = in(7);
qr2     = in(8);
qr3     = in(9);
qddr1     = in(10);
qddr2     = in(11);
qddr3     = in(12);
u1     = in(13);
u2     = in(14);
u3     = in(15);

% SIN COMPENSACIÓN
Tau_add=[0;0;0]; 

%COMPESADOR DE GRAVEDAD
% g=9.81; %gravedad                                                                                 
% Ga= [0; g*(139.39*cos(q2) - 65.596*sin(q2) + 32.798*q3*cos(q2)); 32.798*g*sin(q2)];
% Tau_add=Ga; 

%COMPESADOR DE GRAVEDAD CON REFERENCIA
% g=9.81; %gravedad                                                                                 
% Gar= [0; g*(139.39*cos(qr2) - 65.596*sin(qr2) + 32.798*qr3*cos(qr2)); 32.798*g*sin(qr2)];
% Tau_add=Gar; 

%PRECOMPENSACIÓN DE DINÁMICA CON REFERENCIA
% Ma = [81.996*q3*cos(q2)^2 - 73.796*sin(2.0*q2) + 84.46*cos(q2)^2 - 32.798*q3*sin(2.0*q2) + 32.798*q3^2*cos(q2)^2 + 100.37, 32.798*cos(q2) + 69.696*sin(q2) + 16.399*q3*sin(q2), -16.399*cos(q2);...
%         32.798*cos(q2) + 69.696*sin(q2) + 16.399*q3*sin(q2),                    32.798*q3^2 + 81.996*q3 + 196.23,         -32.798;...
%          -16.399*cos(q2),                                             -32.798,          34.218];
%  
% Va = [0.08435*qd1 + 69.696*qd2^2*cos(q2) - 32.798*qd2^2*sin(q2) + 40.998*qd1*qd3 + 32.798*qd2*qd3*sin(q2) + 16.399*q3*qd2^2*cos(q2) + 32.798*q3*qd1*qd3 - 147.59*qd1*qd2*cos(2.0*q2) + 40.998*qd1*qd3*cos(2.0*q2) - 84.46*qd1*qd2*sin(2.0*q2) - 32.798*qd1*qd3*sin(2.0*q2) - 65.596*q3*qd1*qd2*cos(2.0*q2) + 32.798*q3*qd1*qd3*cos(2.0*q2) - 81.996*q3*qd1*qd2*sin(2.0*q2) - 32.798*q3^2*qd1*qd2*sin(2.0*q2);...
%                                                    0.1038*qd2 + 81.996*qd2*qd3 + 73.796*qd1^2*cos(2.0*q2) + 42.23*qd1^2*sin(2.0*q2) + 32.798*q3*qd1^2*cos(2.0*q2) + 40.998*q3*qd1^2*sin(2.0*q2) + 16.399*q3^2*qd1^2*sin(2.0*q2) + 65.596*q3*qd2*qd3;...
%                                                                                  0.048931*qd3 - 40.998*qd1^2*cos(q2)^2 - 32.798*q3*qd2^2 + 16.399*qd1^2*sin(2.0*q2) - 40.998*qd2^2 - 32.798*q3*qd1^2*cos(q2)^2];
%  
% g=9.81; %gravedad
% 
% Ga= [0; g*(139.39*cos(q2) - 65.596*sin(q2) + 32.798*q3*cos(q2)); 32.798*g*sin(q2)];
% Tau_add=Ma*[qddr1;qddr2;qddr3]+Va+Ga;

%PAR CALCULADO
% Ma = [81.996*q3*cos(q2)^2 - 73.796*sin(2.0*q2) + 84.46*cos(q2)^2 - 32.798*q3*sin(2.0*q2) + 32.798*q3^2*cos(q2)^2 + 100.37, 32.798*cos(q2) + 69.696*sin(q2) + 16.399*q3*sin(q2), -16.399*cos(q2);...
%         32.798*cos(q2) + 69.696*sin(q2) + 16.399*q3*sin(q2),                    32.798*q3^2 + 81.996*q3 + 196.23,         -32.798;...
%          -16.399*cos(q2),                                             -32.798,          34.218];
%  
% Va = [0.08435*qd1 + 69.696*qd2^2*cos(q2) - 32.798*qd2^2*sin(q2) + 40.998*qd1*qd3 + 32.798*qd2*qd3*sin(q2) + 16.399*q3*qd2^2*cos(q2) + 32.798*q3*qd1*qd3 - 147.59*qd1*qd2*cos(2.0*q2) + 40.998*qd1*qd3*cos(2.0*q2) - 84.46*qd1*qd2*sin(2.0*q2) - 32.798*qd1*qd3*sin(2.0*q2) - 65.596*q3*qd1*qd2*cos(2.0*q2) + 32.798*q3*qd1*qd3*cos(2.0*q2) - 81.996*q3*qd1*qd2*sin(2.0*q2) - 32.798*q3^2*qd1*qd2*sin(2.0*q2);...
%                                                    0.1038*qd2 + 81.996*qd2*qd3 + 73.796*qd1^2*cos(2.0*q2) + 42.23*qd1^2*sin(2.0*q2) + 32.798*q3*qd1^2*cos(2.0*q2) + 40.998*q3*qd1^2*sin(2.0*q2) + 16.399*q3^2*qd1^2*sin(2.0*q2) + 65.596*q3*qd2*qd3;...
%                                                                                  0.048931*qd3 - 40.998*qd1^2*cos(q2)^2 - 32.798*q3*qd2^2 + 16.399*qd1^2*sin(2.0*q2) - 40.998*qd2^2 - 32.798*q3*qd1^2*cos(q2)^2];
%  
% g=9.81; %gravedad
% 
% Ga= [0; g*(139.39*cos(q2) - 65.596*sin(q2) + 32.798*q3*cos(q2)); 32.798*g*sin(q2)];
% Tau_add=Ma*([qddr1;qddr2;qddr3]+[u1;u2;u3])+Va+Ga;


end