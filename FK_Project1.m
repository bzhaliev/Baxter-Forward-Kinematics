%% Baxter Forward Kinematics
%Link lengthes
L0 = 0.28135;
L1 = 0.125;
L2 = 0.36435;
L3 = 0.069;
L4 = 0.37429;
L5 = 0.01;
L6 = 0.229525;
%Theta value
%Here we used different angle values for Theta
t1 = 0;
t2 = 0;
t3 = 0;
t4 = 0;
t5 = 0;
t6 = 0;
t7 = 0;
%Initializing the required transformations
T_01 = [cosd(t1) -sind(t1) 0 0; sind(t1) cosd(t1) 0 0; 0 0 1 L0; 0 0 0 1];
T_12 = [cosd(t2+90) -sind(t2+90) 0 L1; 0 0 1 0; -sind(t2+90) cosd(t2+90) 0 0; 0 0 0 1];
T_23 = [cosd(t3) -sind(t3) 0 0; 0 0 -1 -L2; sind(t3) cosd(t3) 0 0; 0 0 0 1];
T_34 = [cosd(t4) -sind(t4) 0 L3; 0 0 1 0; -sind(t4) -cosd(t4) 0 0; 0 0 0 1];
T_45 = [cosd(t5) -sind(t5) 0 0; 0 0 -1 -L4; sind(t5) cosd(t5) 0 0; 0 0 0 1];
T_56 = [cosd(t6) -sind(t6) 0 L5; 0 0 1 0; -sind(t6) -cosd(t6) 0 0; 0 0 0 1];
T_67 = [cosd(t7) -sind(t7) 0 0; 0 0 -1 -L6; sind(t7) cosd(t7) 0 0; 0 0 0 1];
%Final transformation matrix
T_T = T_01*T_12*T_23*T_34*T_45*T_56*T_67