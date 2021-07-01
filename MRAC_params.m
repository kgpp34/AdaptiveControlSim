% Parameters for MRAC
clear
clc

%% Plant
A = [-3.1074 0.9744;0.4501 -4.1003];
B1 = [663.1022;1331.7824];
B2 = [-42.7000;116.5044];
%Bm3 = [-14.2485;-26.8107];
B = [B1,B2];
d = [0.21;0.44];

%% Desired Trejactory
Am = [-3.3808 1.2954;0.4444 -3.0501];
Bm1 = [667.8408;1333.9594];
Bm2 = [-39.2134;117.2730];
%Bm3 = [-14.2485;-26.8107];
Bm = [Bm1,Bm2];
dm = [0.1;0.3];

%% Controller
beta_1 = 100;%100
gamma_d = 1;% 1
Gamma_A = 0.01*eye(2);%0.01去掉 %0.01*eye(2)
gamma_A = 0.0001;%0.0001
Q = 1000*eye(2);%400*eye(2)
P = are(Am,zeros(2,2),Q);

%% Initial Conditions
x_0 = [0.5;0.2];%[0.5;-0.2]
d_hat_0 = [0.08;0.12];
A_hat_0 = [-5,0.2;0.1,-1];
xm_0 = [0;0];
%% Using new index or traditional index
flag = 1;% flag = 1 use new index, flag = 0 use traditional index
%% Simulation
sim('MRAC2016.slx')
save('sim_data','e')
t = e.time;
e_data = e.data;

%以下代码将跟踪误差进行展示
figure
plot(t,e_data,'LineWidth',1)
hold on
grid on
xlabel('Time (s)')
ylabel('e')
legend({'$e_{1}$','$e_{2}$'},'Interpreter','latex')

%以下代码将辨识模型切换信号进行展示
figure
stairs(t, switchsig, 'LineWidth', 0.5)

%以下代码将两个状态误差分别展示（如果需要对比新指标和传统指标，需要将前面定义的flag=0，然后重新运行程序）
figure
subplot(211)
plot(t,e_data(:,1),'LineWidth',1)
hold on
grid on
xlabel('Time (s)')
ylabel('$e_{1}$','Interpreter','latex')
hold on

subplot(212)
plot(t,e_data(:,2),'LineWidth',1)
hold on
grid on
xlabel('Time (s)')
ylabel('$e_{2}$','Interpreter','latex')

