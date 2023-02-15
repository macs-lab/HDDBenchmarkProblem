function sim_result=Function_simulation(Sys_Pc_vcm,Sys_Pc_pzt,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f)

s=tf('s');

%% Simulation condition
Mr_p=20;                          % Multi-rate for continuous-time system
Tsc=Ts/Mr_p;                      % Sampling time for continuous-time system
Tsim=1.1;                         % End of simulation time

%% Controlled object
Sys_Pcd_vcm=c2d(ssbal(ss(Sys_Pc_vcm)),Tsc);[A_Pcd_vcm,B_Pcd_vcm,C_Pcd_vcm,~]=ssdata(ssbal(Sys_Pcd_vcm));
Sys_Pcd_pzt=c2d(ssbal(ss(Sys_Pc_pzt)),Tsc);[A_Pcd_pzt,B_Pcd_pzt,C_Pcd_pzt,~]=ssdata(ssbal(Sys_Pcd_pzt));

%% Feedback Controller & Multi-rate filter
[A_Cd_vcm,B_Cd_vcm,C_Cd_vcm,D_Cd_vcm]=ssdata(ssbal(ss(Sys_Cd_vcm)));
[A_Fm_vcm,B_Fm_vcm,C_Fm_vcm,D_Fm_vcm]=ssdata(ssbal(ss(Sys_Fm_vcm)));
[A_Cd_pzt,B_Cd_pzt,C_Cd_pzt,D_Cd_pzt]=ssdata(ssbal(ss(Sys_Cd_pzt)));
[A_Fm_pzt,B_Fm_pzt,C_Fm_pzt,D_Fm_pzt]=ssdata(ssbal(ss(Sys_Fm_pzt)));

%% Disturbance signal
% FAN-Induced Disturbance
Sys_Dp1_c=0.6/(s^2+2*0.008*2200*2*pi*s+(2200*2*pi)^2);Sys_Dp1=c2d(ssbal(ss(Sys_Dp1_c)),Tsc);[A_Dp1,B_Dp1,C_Dp1,~]=ssdata(ssbal(Sys_Dp1));
Sys_Dp2_c=0.3/(s^2+2*0.005*2937*2*pi*s+(2937*2*pi)^2);Sys_Dp2=c2d(ssbal(ss(Sys_Dp2_c)),Tsc);[A_Dp2,B_Dp2,C_Dp2,~]=ssdata(ssbal(Sys_Dp2));
Sys_Dp3_c=1/(s^2+2*0.005*3300*2*pi*s+(3300*2*pi)^2);Sys_Dp3=c2d(ssbal(ss(Sys_Dp3_c)),Tsc);[A_Dp3,B_Dp3,C_Dp3,~]=ssdata(ssbal(Sys_Dp3));
Sys_Dp4_c=0.5/(s^2+2*0.005*3545*2*pi*s+(3545*2*pi)^2);Sys_Dp4=c2d(ssbal(ss(Sys_Dp4_c)),Tsc);[A_Dp4,B_Dp4,C_Dp4,~]=ssdata(ssbal(Sys_Dp4));
Sys_Dp5_c=0.3/(s^2+2*0.002*3980*2*pi*s+(3980*2*pi)^2);Sys_Dp5=c2d(ssbal(ss(Sys_Dp5_c)),Tsc);[A_Dp5,B_Dp5,C_Dp5,~]=ssdata(ssbal(Sys_Dp5));
Sys_Dp6_c=1/(s^2+2*0.01*4220*2*pi*s+(4220*2*pi)^2);Sys_Dp6=c2d(ssbal(ss(Sys_Dp6_c)),Tsc);[A_Dp6,B_Dp6,C_Dp6,~]=ssdata(ssbal(Sys_Dp6));
Sys_Dp7_c=1/(s^2+2*0.008*4380*2*pi*s+(4380*2*pi)^2);Sys_Dp7=c2d(ssbal(ss(Sys_Dp7_c)),Tsc);[A_Dp7,B_Dp7,C_Dp7,~]=ssdata(ssbal(Sys_Dp7));
Sys_Dp8_c=0.5/(s^2+2*0.002*5072*2*pi*s+(5072*2*pi)^2);Sys_Dp8=c2d(ssbal(ss(Sys_Dp8_c)),Tsc);[A_Dp8,B_Dp8,C_Dp8,~]=ssdata(ssbal(Sys_Dp8));
Sys_Dp9_c=2/(s^2+2*0.003*5370*2*pi*s+(5370*2*pi)^2);Sys_Dp9=c2d(ssbal(ss(Sys_Dp9_c)),Tsc);[A_Dp9,B_Dp9,C_Dp9,~]=ssdata(ssbal(Sys_Dp9));
Sys_Dp10_c=15/(s^2+2*0.04*5850*2*pi*s+(5850*2*pi)^2);Sys_Dp10=c2d(ssbal(ss(Sys_Dp10_c)),Tsc);[A_Dp10,B_Dp10,C_Dp10,~]=ssdata(ssbal(Sys_Dp10));
Sys_Dp11_c=10/(s^2+2*0.008*6660*2*pi*s+(6660*2*pi)^2);Sys_Dp11=c2d(ssbal(ss(Sys_Dp11_c)),Tsc);[A_Dp11,B_Dp11,C_Dp11,~]=ssdata(ssbal(Sys_Dp11));
Sys_Dp12_c=1.5/(s^2+2*0.003*7670*2*pi*s+(7670*2*pi)^2);Sys_Dp12=c2d(ssbal(ss(Sys_Dp12_c)),Tsc);[A_Dp12,B_Dp12,C_Dp12,~]=ssdata(ssbal(Sys_Dp12));
Sys_Dp13_c=2.5/(s^2+2*0.07*9200*2*pi*s+(9200*2*pi)^2);Sys_Dp13=c2d(ssbal(ss(Sys_Dp13_c)),Tsc);[A_Dp13,B_Dp13,C_Dp13,~]=ssdata(ssbal(Sys_Dp13));

% RRO
RRO_data=readmatrix("Data_RRO.txt")*0.5e-10;
num_sector=420;

% Rotational vibration
Sys_Df_c=3e-10*(s+50*2*pi)/(s+3*2*pi)*(s^2+2*20*2000*2*pi*s+(2000*2*pi)^2)/(s^2+2*0.1*250*2*pi*s+(250*2*pi)^2);Sys_Df=c2d(ssbal(ss(Sys_Df_c)),Tsc);[A_Df,B_Df,C_Df,~]=ssdata(ssbal(Sys_Df));

% Random signal for disturbance
rng(1,'twister');u_random1 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(2,'twister');u_random2 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(3,'twister');u_random3 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(4,'twister');u_random4 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(5,'twister');u_random5 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(6,'twister');u_random6 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(7,'twister');u_random7 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(8,'twister');u_random8 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(9,'twister');u_random9 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(10,'twister');u_random10 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(11,'twister');u_random11 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(12,'twister');u_random12 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(13,'twister');u_random13 = (rand(round(Tsim/Tsc)+1,1)-0.5);
rng(14,'twister');u_random14 = (rand(round(Tsim/Tsc)+1,1)-0.5);


%% Simulation
% Initial value
x_Cd_vcm=zeros(length(A_Cd_vcm),1);x_Fm_vcm=zeros(length(A_Fm_vcm),1);
x_Cd_pzt=zeros(length(A_Cd_pzt),1);x_Fm_pzt=zeros(length(A_Fm_pzt),1);
dx_Df=zeros(length(A_Df),1);dy_Df=0;
ddf=0;
dx_Dp1=zeros(length(A_Dp1),1);dy_Dp1=0;
dx_Dp2=zeros(length(A_Dp2),1);dy_Dp2=0;
dx_Dp3=zeros(length(A_Dp3),1);dy_Dp3=0;
dx_Dp4=zeros(length(A_Dp4),1);dy_Dp4=0;
dx_Dp5=zeros(length(A_Dp5),1);dy_Dp5=0;
dx_Dp6=zeros(length(A_Dp6),1);dy_Dp6=0;
dx_Dp7=zeros(length(A_Dp7),1);dy_Dp7=0;
dx_Dp8=zeros(length(A_Dp8),1);dy_Dp8=0;
dx_Dp9=zeros(length(A_Dp9),1);dy_Dp9=0;
dx_Dp10=zeros(length(A_Dp10),1);dy_Dp10=0;
dx_Dp11=zeros(length(A_Dp11),1);dy_Dp11=0;
dx_Dp12=zeros(length(A_Dp12),1);dy_Dp12=0;
dx_Dp13=zeros(length(A_Dp13),1);dy_Dp13=0;
ddp=0;
dx_Pcd_vcm=zeros(length(A_Pcd_vcm),1);dy_Pcd_vcm=0;
dx_Pcd_pzt=zeros(length(A_Pcd_pzt),1);dy_Pcd_pzt=0;
dyc=0;
i_RRO=1;

% Number of inter-sampling
nn_s=Mr_p;
nn_m=Mr_p/Mr_f;

% Simulation
for n=1:round(Tsim/Tsc)+1
   t(n)=Tsc*(n-1);
   
   % Discrete-time system (Single-rate)
   if nn_s==Mr_p
      nn_s=0;
      y(n)=dyc;

      % RRO
      dRRO(n)=RRO_data(i_RRO);
      if i_RRO == num_sector
          i_RRO=1;
      else
          i_RRO=i_RRO+1;
      end

      e(n)= -y(n)+dRRO(n);
      
      % for VCM
      y_Cd_vcm=C_Cd_vcm*x_Cd_vcm+D_Cd_vcm*e(n);
      x_Cd_vcm=A_Cd_vcm*x_Cd_vcm+B_Cd_vcm*e(n);
      ud_vcm(n)=y_Cd_vcm;
      
      % for PZT
      y_Cd_pzt=C_Cd_pzt*x_Cd_pzt+D_Cd_pzt*e(n);
      x_Cd_pzt=A_Cd_pzt*x_Cd_pzt+B_Cd_pzt*e(n);
      ud_pzt(n)=y_Cd_pzt;

   else
      dRRO(n)=dRRO(n-1);
      e(n)=e(n-1);
	  ud_vcm(n)=ud_vcm(n-1);
	  ud_pzt(n)=ud_pzt(n-1);
   end
   
   % Discrete-time system (Multi-rate)
   if nn_m==Mr_p/Mr_f
      nn_m=0;
	  
	  % for VCM
      y_Fm_vcm=C_Fm_vcm*x_Fm_vcm+D_Fm_vcm*ud_vcm(n);
      x_Fm_vcm=A_Fm_vcm*x_Fm_vcm+B_Fm_vcm*ud_vcm(n);
      uc_vcm(n)=y_Fm_vcm;   
      
	  % for PZT
      y_Fm_pzt=C_Fm_pzt*x_Fm_pzt+D_Fm_pzt*ud_pzt(n);
      x_Fm_pzt=A_Fm_pzt*x_Fm_pzt+B_Fm_pzt*ud_pzt(n);
      uc_pzt(n)=y_Fm_pzt;   
   else
	  uc_vcm(n)=uc_vcm(n-1);
	  uc_pzt(n)=uc_pzt(n-1);
   end

   % RV disturbance
   x_Df=dx_Df;
   y_Df=dy_Df;
   dx_Df=A_Df*x_Df+B_Df*u_random1(n);
   dy_Df=C_Df*dx_Df;
   df(n)=ddf;
   ddf = dy_Df;
    
   % Continuous-time system (VCM)
   x_Pcd_vcm=dx_Pcd_vcm;
   y_Pcd_vcm(n)=dy_Pcd_vcm;
   dx_Pcd_vcm=A_Pcd_vcm*x_Pcd_vcm+B_Pcd_vcm*(uc_vcm(n)+df(n));
   dy_Pcd_vcm=C_Pcd_vcm*dx_Pcd_vcm;

   % Continuous-time system (PZT)
   x_Pcd_pzt=dx_Pcd_pzt;
   y_Pcd_pzt(n)=dy_Pcd_pzt;
   dx_Pcd_pzt=A_Pcd_pzt*x_Pcd_pzt+B_Pcd_pzt*uc_pzt(n);
   dy_Pcd_pzt=C_Pcd_pzt*dx_Pcd_pzt;
	
   % FAN-induced disturbance
   x_Dp1=dx_Dp1;y_Dp1=dy_Dp1;dx_Dp1=A_Dp1*x_Dp1+B_Dp1*u_random2(n);dy_Dp1=C_Dp1*dx_Dp1;
   x_Dp2=dx_Dp2;y_Dp2=dy_Dp2;dx_Dp2=A_Dp2*x_Dp2+B_Dp2*u_random3(n);dy_Dp2=C_Dp2*dx_Dp2;
   x_Dp3=dx_Dp3;y_Dp3=dy_Dp3;dx_Dp3=A_Dp3*x_Dp3+B_Dp3*u_random4(n);dy_Dp3=C_Dp3*dx_Dp3;
   x_Dp4=dx_Dp4;y_Dp4=dy_Dp4;dx_Dp4=A_Dp4*x_Dp4+B_Dp4*u_random5(n);dy_Dp4=C_Dp4*dx_Dp4;
   x_Dp5=dx_Dp5;y_Dp5=dy_Dp5;dx_Dp5=A_Dp5*x_Dp5+B_Dp5*u_random6(n);dy_Dp5=C_Dp5*dx_Dp5;
   x_Dp6=dx_Dp6;y_Dp6=dy_Dp6;dx_Dp6=A_Dp6*x_Dp6+B_Dp6*u_random7(n);dy_Dp6=C_Dp6*dx_Dp6;
   x_Dp7=dx_Dp7;y_Dp7=dy_Dp7;dx_Dp7=A_Dp7*x_Dp7+B_Dp7*u_random8(n);dy_Dp7=C_Dp7*dx_Dp7;
   x_Dp8=dx_Dp8;y_Dp8=dy_Dp8;dx_Dp8=A_Dp8*x_Dp8+B_Dp8*u_random9(n);dy_Dp8=C_Dp8*dx_Dp8;
   x_Dp9=dx_Dp9;y_Dp9=dy_Dp9;dx_Dp9=A_Dp9*x_Dp9+B_Dp9*u_random10(n);dy_Dp9=C_Dp9*dx_Dp9;
   x_Dp10=dx_Dp10;y_Dp10=dy_Dp10;dx_Dp10=A_Dp10*x_Dp10+B_Dp10*u_random11(n);dy_Dp10=C_Dp10*dx_Dp10;
   x_Dp11=dx_Dp11;y_Dp11=dy_Dp11;dx_Dp11=A_Dp11*x_Dp11+B_Dp11*u_random12(n);dy_Dp11=C_Dp11*dx_Dp11;
   x_Dp12=dx_Dp12;y_Dp12=dy_Dp12;dx_Dp12=A_Dp12*x_Dp12+B_Dp12*u_random13(n);dy_Dp12=C_Dp12*dx_Dp12;
   x_Dp13=dx_Dp13;y_Dp13=dy_Dp13;dx_Dp13=A_Dp13*x_Dp13+B_Dp13*u_random14(n);dy_Dp13=C_Dp13*dx_Dp13;
   dp(n)=ddp;
   ddp = dy_Dp1+dy_Dp2+dy_Dp3+dy_Dp4+dy_Dp5+dy_Dp6+dy_Dp7+dy_Dp8+dy_Dp9+dy_Dp10+dy_Dp11+dy_Dp12+dy_Dp13;

   % Magnetic-head position
   yc(n)=dyc;dyc=dy_Pcd_vcm+dy_Pcd_pzt+ddp;
   
   nn_s=nn_s+1;nn_m=nn_m+1;
end

% Remove transient response
Nt=find(t>=0.1,1);
sim_result.time=t(Nt:Nt+Mr_p*num_sector*120-1)-t(Nt);
sim_result.uc_vcm=uc_vcm(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.uc_pzt=uc_pzt(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.yc=yc(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.yc_pzt=y_Pcd_pzt(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.yc=yc(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.dp=dp(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.df=df(Nt:Nt+Mr_p*num_sector*120-1);
sim_result.dRRO=dRRO(Nt:Nt+Mr_p*num_sector*120-1);

% DFT
sim_result.freq=[0:length(sim_result.time)-1]/sim_result.time(end);
sim_result.Fr_yc=fft(sim_result.yc);
sim_result.Fr_yc_pzt=fft(sim_result.yc_pzt);
sim_result.Fr_dp=fft(sim_result.dp);
sim_result.Fr_df=fft(sim_result.df);
