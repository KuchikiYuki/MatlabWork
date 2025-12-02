close all;
clear;
clc;

ToRad = pi/180;
Link = MDH_Table_Build();
Link = Transimation_Matrix_Build(Link);
ToDegree = 180/pi;
th1=22.0243; 
th2=280.5876;
th3=332.2131;
d4=199.7;
th5=0;
th6=107.1993;
th7=337.9757; 

Q=[th1,th2,th3,d4,th5,th6,th7]';

T = Forward_kinematics(Link,Q,0);
T = [1,0,0,160;
     0,1,0,0;
     0,0,1,0;
     0,0,0,1];
tic;
Geometric_Inverse_Kinematics(Link,T)
toc;

