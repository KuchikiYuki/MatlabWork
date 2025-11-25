close all;
clear;
clc;

Link = MDH_Table_Build();

th1=0; 
th2=0;
th3=0;
d4=0;
th5=0;
th6=0;
th7=0;

Q=[th1,th2,th3,d4,th5,th6,th7]';
Forward_kinematics(Link,Q,0)
