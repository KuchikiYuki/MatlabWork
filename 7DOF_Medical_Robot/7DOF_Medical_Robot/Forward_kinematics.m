function T = Forward_kinematics(link,Q,fcla)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
ToRad = pi/180;

link(2).theta=Q(1)*ToRad;
link(3).theta=Q(2)*ToRad;
link(4).theta=Q(3)*ToRad;
link(5).d=150+Q(4);
link(6).theta=Q(5)*ToRad;
link(7).theta=Q(6)*ToRad;
link(8).theta=Q(7)*ToRad;

Link = Transimation_Matrix_Build(link);
radius    = 25;  %25
len       = 60;  %60
joint_col = 0;
for i=2:8
    Link(i).T=Link(i-1).T*Link(i).T;
    Link(i).p= Link(i).T(:,4);
    Link(i).x= Link(i).T(:,1);
    Link(i).y= Link(i).T(:,2);  %得到当前关节在base坐标系下的位姿
    Link(i).z= Link(i).T(:,3);
    Link(i).R=[Link(i).x(1:3),Link(i).y(1:3),Link(i).z(1:3)];
    DrawLink(Link(i-1).p,Link(i).p,'b',2); hold on;
end

for i=1:8
    DrawCylinder(Link(i).T, radius,len, joint_col);hold on;
end

DrawFrame(Link(1).T);
DrawFrame(Link(8).T);

axis([-300,600,-300,600,-300,600]);
xlabel('x');
ylabel('y'); 
zlabel('z');
grid on;
drawnow;

T=Link(8).T;
%判断是否清空坐标系
if(fcla)
    cla;
end
hold on

end