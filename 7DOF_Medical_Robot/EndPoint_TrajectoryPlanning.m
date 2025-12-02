close all;
clear;
clc;

Link = MDH_Table_Build();
Link = Transimation_Matrix_Build(Link);

th1 = 69.6359;
th2 = 255.4983;
th3 = 329.3362;
d4 = 0;
th5 = 0;
th6 = 135.1655;
th7 = 290.3641;

q_prev=[th1,th2,th3,d4,th5,th6,th7];

q0 = 160;
q1 = 400;
v_max = 1000;
A = 1000;
dt =0.01;

[q,V,ACC]=Tplanning(q0, q1, v_max, A, dt);

step = length(q);
t = 0:step-1;

figure(1);
plot(t,q);

figure(2);
Forward_kinematics(Link,q_prev,0);
pause(1);
% view(0,0);
% hold on;
for i = 1:step
    T = [1,0,0,q(i);
         0,1,0,0;
         0,0,1,0;
         0,0,0,1];
    Q = Geometric_Inverse_Kinematics(Link,T);
    [q_best,~,~] = Select_Optimal_Solution(Q,q_prev);
    if i < step
        Forward_kinematics(Link,q_best,1);
    else
        Forward_kinematics(Link,q_best,0);
    end
end