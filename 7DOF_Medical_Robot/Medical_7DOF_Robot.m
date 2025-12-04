close all;
clear;
clc;

ToRad = pi/180;
Link = MDH_Table_Build();
Link = Transimation_Matrix_Build(Link);
ToDegree = 180/pi;
th1=45.0000; 
th2=41.7585;
th3=117.2310;
d4=0;
th5=90.0000;
th6=248.9896;
th7=135; 

Q=[th1,th2,th3,d4,th5,th6,th7];

T = Forward_kinematics(Link,Q,0)

% T = [1,0,0,150;
%      0,1,0,150;
%      0,0,1,150;
%      0,0,0,1];
Geometric_Inverse_Kinematics(Link,T);



