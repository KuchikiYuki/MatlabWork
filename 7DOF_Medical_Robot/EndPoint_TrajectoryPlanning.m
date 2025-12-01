close all;
clear;
clc;

Link = MDH_Table_Build();
Link = Transimation_Matrix_Build(Link);

q0 = 100;
q1 = 200;
v_max = 1000;
A = 1000;
dt =0.01;

[q,V,ACC]=Tplanning(q0, q1, v_max, A, dt);

step = length(q);
view(0,0);
hold on;
for i = 1:step
    T = [1,0,0,q(i);
         0,1,0,0;
         0,0,1,0;
         0,0,0,1]
    Q = Geometric_Inverse_Kinematics(Link,T);
    j = Q(1,:,1);
    if i < step
        Forward_kinematics(Link,j,1);
    else
        Forward_kinematics(Link,j,0);
    end
end