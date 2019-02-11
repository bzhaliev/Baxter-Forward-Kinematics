close all
clear all
clc

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
t1=0;
t2=-45+90;
t3=0;
t4=90;
t5=0;
t6=-60;
t7=0;

%Initializing the required transformations
T_01 = [cosd(t1) -sind(t1) 0 0; sind(t1) cosd(t1) 0 0; 0 0 1 L0 ; 0 0 0 1];
T_12 = [cosd(t2) -sind(t2) 0 L1; 0 0 1 0; -sind(t2) -cosd(t2) 0 0; 0 0 0 1];
T_23 = [cosd(t3) -sind(t3) 0 0; 0 0 -1 -L2; sind(t3) cosd(t3) 0 0; 0 0 0 1];
T_34 = [cosd(t4) -sind(t4) 0 L3; 0 0 1 0; -sind(t4) -cosd(t4) 0 0; 0 0 0 1];
T_45 = [cosd(t5) -sind(t5) 0 0; 0 0 -1 -L4; sind(t5) cosd(t5) 0 0; 0 0 0 1];
T_56 = [cosd(t6) -sind(t6) 0 L5; 0 0 1 0; -sind(t6) -cosd(t6) 0 0; 0 0 0 1];
T_67 = [cosd(t7) -sind(t7) 0 0; 0 0 -1 -L6; sind(t7) cosd(t7) 0 0; 0 0 0 1];

%Final transformation matrix
%T_T = T_01*T_12*T_23*T_34*T_45*T_56*T_67
T_02 = T_01*T_12;
T_1_7 = T_12*T_23*T_34*T_45*T_56*T_67;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format long

T = [0.70710678 0.70710678 0 0.026;
    -0.70710678 0.70710678 0 0.219;
    0 0 1 0.108;
    0 0 0 1];
T_inv = inv(T);
T_B_1 = T_01*T_inv;
R_B_1 = [T_B_1(1,1) , T_B_1(1,2) , T_B_1(1,3);
         T_B_1(2,1) , T_B_1(2,2) , T_B_1(2,3);
         T_B_1(3,1) , T_B_1(3,2) , T_B_1(3,3)];

P_1_7org = [T_1_7(1,4); T_1_7(2,4); T_1_7(3,4)]

R_1_7 = [T_1_7(1,1) , T_1_7(1,2) , T_1_7(1,3);
         T_1_7(2,1) , T_1_7(2,2) , T_1_7(2,3);
         T_1_7(3,1) , T_1_7(3,2) , T_1_7(3,3)];

P_E_E7 = [0; 0; 0.1];

P_E_1 = R_B_1*P_1_7org + R_B_1*R_1_7*P_E_E7;
Z_hat_1 = [T_B_1(1,3) ; T_B_1(2,3) ; T_B_1(3,3)];
J1 = cross(Z_hat_1,P_E_1)
