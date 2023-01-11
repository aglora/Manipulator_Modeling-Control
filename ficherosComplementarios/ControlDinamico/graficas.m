%ERROR total cometido en trayectoria en cartesianas
XYZerror=((x-xr).^2+(y-yr).^2+(z-zr).^2).^0.5;
figure(); plot(t, XYZerror,"LineWidth",2); xlabel('tiempo (s)'); ylabel('Error en XYZ (m)'); grid on; title('Error total cometido en cartesianas');

%Trayectorias real y deseada en cartesianas
figure(); plot3(x,y,z,'r',x(1),y(1),z(1),'o',x(length(x)),y(length(x)),z(length(x)),'x',xr,yr,zr); xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)'); grid; title('Trayectoria en el espacio'); legend('Trayectoria seguida','Punto inicial','Punto final','Trayectoria deseada');

% SEÑAL DE CONTROL :Pares generados en las articulaciones para seguir la trayectoria deseada
figure();
subplot(3,1,1); plot(t,Tau(:,1),"LineWidth",2); xlabel('tiempo (s)'); ylabel('Tau 1 (N.m)'); grid on; title('Señal de control');
subplot(3,1,2); plot(t,Tau(:,2),"LineWidth",2); xlabel('tiempo (s)'); ylabel('Tau 2 (N.m)'); grid on;
subplot(3,1,3); plot(t,Tau(:,3),"LineWidth",2); xlabel('tiempo (s)'); ylabel('Tau 3 (N.m)'); grid on;

%ERROR velocidad en coordenadas articulares (referencia - salida)
figure();
subplot(3,1,1); plot(t,qdr(:,1)-qd(:,1),"LineWidth",1); xlabel('tiempo (s)'); ylabel('error qp1 (rad/s)'); grid on; title('Error velocidades articulares');
subplot(3,1,2); plot(t,qdr(:,2)-qd(:,2),"LineWidth",1); xlabel('tiempo (s)'); ylabel('error qp2 (rad/s)'); grid on; 
subplot(3,1,3); plot(t,qdr(:,3)-qd(:,3),"LineWidth",1); xlabel('tiempo (s)'); ylabel('error qp3 (rad/s)'); grid on; 

%ERROR posicion en coordenadas articulares (referencia - salida)
figure(); 
subplot(3,1,1); plot(t,qr(:,1)-q(:,1),"LineWidth",1); xlabel('tiempo (s)'); ylabel('error q1 (rad)'); grid on; title('Error posiciones articulares');
subplot(3,1,2); plot(t,qr(:,2)-q(:,2),"LineWidth",1); xlabel('tiempo (s)'); ylabel('error q2 (rad)'); grid on; 
subplot(3,1,3); plot(t,qr(:,3)-q(:,3),"LineWidth",1); xlabel('tiempo (s)'); ylabel('error q3 (rad)'); grid on; 

%Evolucion velocidades articulares en seguimiento de trayectoria  (REAL y REFERENCIA DESEADA)
figure(); 
subplot(3,1,1); plot(t,qdr(:,1),t,qd(:,1),"LineWidth",1); xlabel('tiempo (s)'); ylabel('qpr1 vs qp1 (rad/s)'); grid on; title('Velocidades articulares');legend('qdr1','qd1');
subplot(3,1,2); plot(t,qdr(:,2),t,qd(:,2),"LineWidth",1); xlabel('tiempo (s)'); ylabel('qpr2 vs qp2 (rad/s)'); grid on; legend('qdr2','qd2');
subplot(3,1,3); plot(t,qdr(:,3),t,qd(:,3),"LineWidth",1); xlabel('tiempo (s)'); ylabel('qpr3 vs qp3 (rad/s)'); grid on; legend('qdr3','qd3');

% Trayectoria posición coordenadas articulares (REALES (salida) Y REFERENCIAS DESEADAS)
figure(); 
subplot(3,1,1); plot(t,qr(:,1),t,q(:,1),"LineWidth",1); xlabel('tiempo (s)'); ylabel('qr1 vs q1 (rad)'); grid on; title('Posiciones articulares'); legend('qr1','q1');
subplot(3,1,2); plot(t,qr(:,2),t,q(:,2),"LineWidth",1); xlabel('tiempo (s)'); ylabel('qr2 vs q2 (rad)'); grid on; legend('qr2','q2');
subplot(3,1,3); plot(t,qr(:,3),t,q(:,3),"LineWidth",1); xlabel('tiempo (s)'); ylabel('qr3 vs q3 (rad)'); grid on; legend('qr3','q3');






  