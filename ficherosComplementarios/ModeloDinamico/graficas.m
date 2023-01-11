figure(3); %ACELEREACIONES ARTICULARES
subplot(3,1,1); plot(out.t,out.qdd(:,1),out.t,out.qdd_proof(:,1)); xlabel('tiempo (s)'); ylabel('qdd1 vs qdd1 proof (rad/s^2)'); grid on; 
subplot(3,1,2); plot(out.t,out.qdd(:,2),out.t,out.qdd_proof(:,2)); xlabel('tiempo (s)'); ylabel('qdd2 vs qdd2 proof (rad/s^2)'); grid on; 
subplot(3,1,3); plot(out.t,out.qdd(:,3),out.t,out.qdd_proof(:,3)); xlabel('tiempo (s)'); ylabel('qdd3 vs qdd3 proof (m/s^2)'); grid on; 

figure(2); %VELOCIDADES ARTICULARES
subplot(3,1,1); plot(out.t,out.qd(:,1),out.t,out.qd_proof(:,1)); xlabel('tiempo (s)'); ylabel('qd1 vs qp1 proof (rad/s)'); grid on; 
subplot(3,1,2); plot(out.t,out.qd(:,2),out.t,out.qd_proof(:,2)); xlabel('tiempo (s)'); ylabel('qd2 vs qp2 proof (rad/s)'); grid on; 
subplot(3,1,3); plot(out.t,out.qd(:,3),out.t,out.qd_proof(:,3)); xlabel('tiempo (s)'); ylabel('qd3 vs qp3 proof (m/s)'); grid on; 

figure(1); %POSICIONES ARTICULARES
subplot(3,1,1); plot(out.t,out.q(:,1),out.t,out.q_proof(:,1)); xlabel('tiempo (s)'); ylabel('q1 vs q1 proof (rad)'); grid on; 
subplot(3,1,2); plot(out.t,out.q(:,2),out.t,out.q_proof(:,2)); xlabel('tiempo (s)'); ylabel('q2 vs q2 proof (rad)'); grid on; 
subplot(3,1,3); plot(out.t,out.q(:,3),out.t,out.q_proof(:,3)); xlabel('tiempo (s)'); ylabel('q3 vs q3 proof (m)'); grid on; 






  