function Link = Transimation_Matrix_Build(link)
%根据DH表建立每个关节相对上一个关节的齐次变换矩阵
%   Detailed explanation goes here
%                 ​           cosθi              −sinθi​​                  0​​​             ai−1
%       i-1-----          ​sinθi*​cosαi−1       cosθi​*cosαi−1         −sinαi−1       −di​*sinαi−1​
%            |    =       sinθi​*sinαi−1       cosθi​*sinαi−1          cosαi−1        ​​di​*cosαi−1​​​
%            |i               0                   0                    0               1​​​
for i=1:8
    if(i>1)
        C=cos(link(i).theta);
        S=sin(link(i).theta);
        Cai_1=cos(link(i-1).alpha);
        Sai_1=sin(link(i-1).alpha);
        ai_1=link(i-1).a;    %distance between zi and zi+1
        di=link(i).d;    %distance between xi-1 and xi

        link(i).x=[C,S*Cai_1,S*Sai_1,0]';    %增加结构体中的成员变量
        link(i).y=[-S,C*Cai_1,C*Sai_1,0]';    
        link(i).z=[0, -Sai_1,Cai_1,0]';
        link(i).p=[ai_1,-di*Sai_1,di*Cai_1,1]';

        link(i).R=[link(i).x(1:3),link(i).y(1:3),link(i).z(1:3)];
        link(i).T=[link(i).x,link(i).y,link(i).z,link(i).p];   %得到当前关节在上一关节的位姿
    else
        link(i).x=[1,0,0,0]';    %增加结构体中的成员变量
        link(i).y=[0,1,0,0]';
        link(i).z=[0,0,1,0]';
        link(i).p=[0,0,0,1]';

        link(i).R=[link(i).x(1:3),link(i).y(1:3),link(i).z(1:3)];
        link(i).T=[link(i).x,link(i).y,link(i).z,link(i).p];

    end
end
Link = link;
end