function Link = MDH_Table_Build()

%根据机械臂结构建立MDH表
%   Detailed explanation goes here

ToRad = pi/180;

link    = struct('name','joint', 'theta',  0, 'd', 0, 'a', 0, 'alpha',0*ToRad);     % az 
link(1) = struct('name','Base' , 'theta',  0*ToRad, 'd', 0, 'a', 0, 'alpha',0*ToRad);        %BASE to 1
link(2) = struct('name','J1' , 'theta',   0*ToRad, 'd', 300, 'a', 0, 'alpha',-90*ToRad);       %1 TO 2   320
link(3) = struct('name','J2' , 'theta',  0*ToRad, 'd', 150, 'a', 200, 'alpha',0*ToRad);    %2 TO 3     200
link(4) = struct('name','J3' , 'theta',  0*ToRad, 'd', 0, 'a', 0, 'alpha',-90*ToRad);          %3 TO 4    25
link(5) = struct('name','J4' , 'theta',  0*ToRad, 'd', 150, 'a', 0, 'alpha',0*ToRad);          %4 TO 5    300
link(6) = struct('name','J5' , 'theta',  0*ToRad, 'd', 0, 'a', 0, 'alpha',90*ToRad);          %5 TO 6
link(7) = struct('name','J6' , 'theta',  0*ToRad, 'd', 0, 'a', 0, 'alpha',-90*ToRad);          %6 TO 7
link(8) = struct('name','J7',  'theta',  0*ToRad, 'd',  0,  'a', 0, 'alpha', 0);     %7 TO E

Link = link;

end