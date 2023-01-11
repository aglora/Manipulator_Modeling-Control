%CÁLCULO DE PARÁMETROS DEL CONTROLADOR

%MODELO DEL SISTEMA

%ARTICULACION 1
a1=381.6195; b1=0.08435; 
%ARTICULACION 2
a2=393.0195; b2=0.1038;
%ARTICULACION 3
a3=34.218; b3=0.048931;
%ESPECIFICACIONES DE DISEÑO
ts=0.1;

%Control de PD descentralizado
if(1)
Kp1 = 36*a1/ts^2;
Kd1 = 12*a1/ts-b1;
Ki1 = 0;

Kp2 = 36*a2/ts^2;
Kd2 = 12*a2/ts-b2;
Ki2 = 0; 

Kp3 = 36*a3/ts^2;
Kd3 = 12*a3/ts-b3;
Ki3 = 0; 
end

%Control de PID descentralizado
if(0)
Kc = 36*b1/(ts^2);
T1 = a1/b1;
T2 = ts/3;
Ki1 = Kc;
Kd1 = Kc*T1*T2;
Kp1 = Kc*(T1+T2);

Kc = 36*b2/(ts^2);
T1 = a2/b2;
T2 = ts/3;
Ki2 = Kc;
Kd2 = Kc*T1*T2;
Kp2 = Kc*(T1+T2);

Kc = 36*b3/(ts^2);
T1 = a3/b3;
T2 = ts/3;
Ki3 = Kc;
Kd3 = Kc*T1*T2;
Kp3 = Kc*(T1+T2);
end

%Control con precompensación dinamica + PD
if(0)
Kp1 = 36*a1/ts^2;
Kd1 = 12*a1/ts;
Ki1 = 0;

Kp2 = 36*a2/ts^2;
Kd2 = 12*a2/ts;
Ki2 = 0; 

Kp3 = 36*a3/ts^2;
Kd3 = 12*a3/ts;
Ki3 = 0; 

end

%Control Par Calculado
if(0)
Kp1 = 36/ts^2;
Kd1 = 12/ts;
Ki1 = 0;

Kp2 = 36/ts^2;
Kd2 = 12/ts;
Ki2 = 0; 

Kp3 = 36/ts^2;
Kd3 = 12/ts;
Ki3 = 0; 
end


