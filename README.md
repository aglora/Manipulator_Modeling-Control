# Manipulator_Modeling-Control

<div style="display: flex; flex-direction: row;">
  <img src="https://github.com/aglora/Manipulator_Modeling-Control/blob/main/imgs/3dof-DH.png" width="300" />
  <img src="https://github.com/aglora/Manipulator_Modeling-Control/blob/main/imgs/6dof-DH.png" width="500" />
</div>

# OBJETIVO

El objetivo del presente trabajo es tratar de forma práctica los tres aspectos principales
que componen los contenidos teóricos de la asignatura Fundamentos de Robótica
perteneciente al tercer curso del Grado en Ingeniería Electrónica, Robótica y
Mecatrónica.

# RESUMEN

En este sentido, partiendo de un robot manipulador de 6 grados de libertad dado, se
realizará el análisis cinemático, análisis dinámico y control de éste. Por cuestión de
simplicidad se trabajará mayormente con sus tres primeras articulaciones, reduciendo
el problema a 3 grados de libertad.

La obtención de la cinemática directa e inversa del robot resulta de vital importancia
para conseguir tener una relación inmediata entre la posición del efector final del
manipulador y el valor necesario de sus articulaciones para conseguirlo. 

El siguiente paso será lograr conseguir un modelo que describa de manera bastante aproximada la
dinámica de nuestro sistema. Una vez alcanzado ese punto, tendremos la tarea de
mover el extremo del robot entre dos posiciones, tratándose de un problema de
seguimiento de trayectorias. Desarrollaremos el control cinemático que genere dicha
trayectoria y veremos diversas técnicas de control aplicándolas al conjunto, de forma
que se cumplan los requisitos establecidos con la mayor calidad y el menor error
cometido posible.

<img src="https://github.com/aglora/Manipulator_Modeling-Control/blob/main/imgs/esquema.png" width="800" />

# SIMULACIONES

Se ha usado Matlab & Simulink para las simulaicones cinemáticas y dinámicas de movimiento y control del brazo articulado.

<img src="https://github.com/aglora/Manipulator_Modeling-Control/blob/main/imgs/Simulink.png" width="900" />
