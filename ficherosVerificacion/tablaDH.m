% -------------------------------------------------
% APARTADO A1 - Tabla de par�metros de Denavit-Hartemberg
% -------------------------------------------------

% La ejecuci�n de este archivo de MATLAB debe dar como resultado una matriz BTP con resultado que se pide

function TDH = tablaDH
% Definici�n de variables simb�licas (no cambiar)
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms q1 q2 q3 q4 q5 q6 real  
PI = sym(pi);

% Sustituya los ceros de la siguiente tabla por los valores que corresponda.
% En cada fila los par�metros DH son por este orden: theta, d, a,alpha
% Emplee expresiones simb�licas L0, L1, L2A, etc para las longitudes y 
% valores en radianes para los �ngulos (por ejemplo PI/2).
% Use la variable PI (en may�sculas) para referirse a pi radianes

%       theta_i  d_i   a_i   alpha_i
TDH = [ 0,       L0,    0,    0           ;...  % Link i=0
        q1+0,     0,    0,    PI/2           ;...  % Link i=1
        q2-PI/2, -L1, -L2B,  -PI/2           ;...  % Link i=2
        0,   q3+L2A+L3,  0,    0           ;...  % Link i=3
        q4+PI/2,  L4,    0,    PI/2           ;...  % Link i=4
        -PI/2,  q5+L5,   0,    PI           ;...  % Link i=5
        q6+PI/2,       0,     L6,    0           ];    % Link i=6        
end