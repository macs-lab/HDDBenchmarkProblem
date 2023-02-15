clc;clear;close all

%% Cotrolled object (Continuous-time system)
Plant

%% Feedback Controller
load Data_Cd.mat

%% Multi-rate filter
load Data_Fm.mat

%% Cotrolled object (Discrete-time system)
% Case 1
Sys_Pdm0_vcm_c1=c2d(Sys_Pc_vcm_c1,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c1=Sys_Pdm0_vcm_c1*Sys_Fm_vcm;
Sys_Pd_vcm_c1=d2d(Sys_Pdm_vcm_c1,Ts,'ZOH');
Sys_Pdm0_pzt_c1=c2d(Sys_Pc_pzt_c1,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c1=Sys_Pdm0_pzt_c1*Sys_Fm_pzt;
Sys_Pd_pzt_c1=d2d(Sys_Pdm_pzt_c1,Ts,'ZOH');

% Case 2
Sys_Pdm0_vcm_c2=c2d(Sys_Pc_vcm_c2,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c2=Sys_Pdm0_vcm_c2*Sys_Fm_vcm;
Sys_Pd_vcm_c2=d2d(Sys_Pdm_vcm_c2,Ts,'ZOH');
Sys_Pdm0_pzt_c2=c2d(Sys_Pc_pzt_c2,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c2=Sys_Pdm0_pzt_c2*Sys_Fm_pzt;
Sys_Pd_pzt_c2=d2d(Sys_Pdm_pzt_c2,Ts,'ZOH');

% Case 3
Sys_Pdm0_vcm_c3=c2d(Sys_Pc_vcm_c3,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c3=Sys_Pdm0_vcm_c3*Sys_Fm_vcm;
Sys_Pd_vcm_c3=d2d(Sys_Pdm_vcm_c3,Ts,'ZOH');
Sys_Pdm0_pzt_c3=c2d(Sys_Pc_pzt_c3,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c3=Sys_Pdm0_pzt_c3*Sys_Fm_pzt;
Sys_Pd_pzt_c3=d2d(Sys_Pdm_pzt_c3,Ts,'ZOH');

% Case4
Sys_Pdm0_vcm_c4=c2d(Sys_Pc_vcm_c4,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c4=Sys_Pdm0_vcm_c4*Sys_Fm_vcm;
Sys_Pd_vcm_c4=d2d(Sys_Pdm_vcm_c4,Ts,'ZOH');
Sys_Pdm0_pzt_c4=c2d(Sys_Pc_pzt_c4,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c4=Sys_Pdm0_pzt_c4*Sys_Fm_pzt;
Sys_Pd_pzt_c4=d2d(Sys_Pdm_pzt_c4,Ts,'ZOH');

% Case 5
Sys_Pdm0_vcm_c5=c2d(Sys_Pc_vcm_c5,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c5=Sys_Pdm0_vcm_c5*Sys_Fm_vcm;
Sys_Pd_vcm_c5=d2d(Sys_Pdm_vcm_c5,Ts,'ZOH');
Sys_Pdm0_pzt_c5=c2d(Sys_Pc_pzt_c5,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c5=Sys_Pdm0_pzt_c5*Sys_Fm_pzt;
Sys_Pd_pzt_c5=d2d(Sys_Pdm_pzt_c5,Ts,'ZOH');

% Case 6
Sys_Pdm0_vcm_c6=c2d(Sys_Pc_vcm_c6,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c6=Sys_Pdm0_vcm_c6*Sys_Fm_vcm;
Sys_Pd_vcm_c6=d2d(Sys_Pdm_vcm_c6,Ts,'ZOH');
Sys_Pdm0_pzt_c6=c2d(Sys_Pc_pzt_c6,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c6=Sys_Pdm0_pzt_c6*Sys_Fm_pzt;
Sys_Pd_pzt_c6=d2d(Sys_Pdm_pzt_c6,Ts,'ZOH');

% Case 7
Sys_Pdm0_vcm_c7=c2d(Sys_Pc_vcm_c7,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c7=Sys_Pdm0_vcm_c7*Sys_Fm_vcm;
Sys_Pd_vcm_c7=d2d(Sys_Pdm_vcm_c7,Ts,'ZOH');
Sys_Pdm0_pzt_c7=c2d(Sys_Pc_pzt_c7,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c7=Sys_Pdm0_pzt_c7*Sys_Fm_pzt;
Sys_Pd_pzt_c7=d2d(Sys_Pdm_pzt_c7,Ts,'ZOH');

% Case 8
Sys_Pdm0_vcm_c8=c2d(Sys_Pc_vcm_c8,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c8=Sys_Pdm0_vcm_c8*Sys_Fm_vcm;
Sys_Pd_vcm_c8=d2d(Sys_Pdm_vcm_c8,Ts,'ZOH');
Sys_Pdm0_pzt_c8=c2d(Sys_Pc_pzt_c8,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c8=Sys_Pdm0_pzt_c8*Sys_Fm_pzt;
Sys_Pd_pzt_c8=d2d(Sys_Pdm_pzt_c8,Ts,'ZOH');

% Case 9
Sys_Pdm0_vcm_c9=c2d(Sys_Pc_vcm_c9,Ts/Mr_f,'ZOH');
Sys_Pdm_vcm_c9=Sys_Pdm0_vcm_c9*Sys_Fm_vcm;
Sys_Pd_vcm_c9=d2d(Sys_Pdm_vcm_c9,Ts,'ZOH');
Sys_Pdm0_pzt_c9=c2d(Sys_Pc_pzt_c9,Ts/Mr_f,'ZOH');
Sys_Pdm_pzt_c9=Sys_Pdm0_pzt_c9*Sys_Fm_pzt;
Sys_Pd_pzt_c9=d2d(Sys_Pdm_pzt_c9,Ts,'ZOH');

% All
Sys_Pd_vcm_all=[Sys_Pd_vcm_c1;Sys_Pd_vcm_c2;Sys_Pd_vcm_c3;Sys_Pd_vcm_c4;Sys_Pd_vcm_c5;Sys_Pd_vcm_c6;Sys_Pd_vcm_c7;Sys_Pd_vcm_c8;Sys_Pd_vcm_c9];
Sys_Pd_pzt_all=[Sys_Pd_pzt_c1;Sys_Pd_pzt_c2;Sys_Pd_pzt_c3;Sys_Pd_pzt_c4;Sys_Pd_pzt_c5;Sys_Pd_pzt_c6;Sys_Pd_pzt_c7;Sys_Pd_pzt_c8;Sys_Pd_pzt_c9];


%% Frequency response
f=logspace(1,log10(60e3),3000);
Fr_Pc_vcm_all=squeeze(freqresp(Sys_Pc_vcm_all,f*2*pi)).';
Fr_Pc_pzt_all=squeeze(freqresp(Sys_Pc_pzt_all,f*2*pi)).';
Fr_Pd_vcm_all=squeeze(freqresp(Sys_Pd_vcm_all,f*2*pi)).';
Fr_Pd_pzt_all=squeeze(freqresp(Sys_Pd_pzt_all,f*2*pi)).';
Fr_Cd_vcm=squeeze(freqresp(Sys_Cd_vcm,f*2*pi));
Fr_Cd_pzt=squeeze(freqresp(Sys_Cd_pzt,f*2*pi));
Fr_Fm_vcm=squeeze(freqresp(Sys_Fm_vcm,f*2*pi));
Fr_Fm_pzt=squeeze(freqresp(Sys_Fm_pzt,f*2*pi));

Fr_L_vcm_all=Fr_Pd_vcm_all.*Fr_Cd_vcm;
Fr_L_pzt_all=Fr_Pd_pzt_all.*Fr_Cd_pzt;

Fr_L=Fr_L_vcm_all+Fr_L_pzt_all;
Fr_S=1./(1+Fr_L);

%% figure
figure(9)
subplot(211)
semilogx(f,20*log10(abs(Fr_Pc_vcm_all(:,1:7))))
hold on
semilogx(f,20*log10(abs(Fr_Pc_vcm_all(:,8:9))),'--')
hold off
title('P_{cv}');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 f(end) -90 10])
subplot(212)
semilogx(f,mod(angle(Fr_Pc_vcm_all(:,1:7))*180/pi+360,360)-360)
hold on
semilogx(f,mod(angle(Fr_Pc_vcm_all(:,8:9))*180/pi+360,360)-360,'--')
hold off
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 f(end) -360 0]);yticks(-360:90:0)
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')

figure(10)
subplot(211)
semilogx(f,20*log10(abs(Fr_Pc_pzt_all(:,1:7))))
hold on
semilogx(f,20*log10(abs(Fr_Pc_pzt_all(:,8:9))),'--')
hold off
title('P_{cp}');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 f(end) -10 30])
subplot(212)
semilogx(f,angle(Fr_Pc_pzt_all(:,1:7))*180/pi)
hold on
semilogx(f,angle(Fr_Pc_pzt_all(:,8:9))*180/pi,'--')
hold off
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 f(end) -180 180]);yticks(-180:90:180)
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')

figure(11)
subplot(211)
semilogx(f,20*log10(abs(Fr_Fm_vcm)),f,20*log10(abs(Fr_Fm_pzt)))
title('Multi-rate filter');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 f(end) -50 5])
subplot(212)
semilogx(f,angle(Fr_Fm_vcm)*180/pi,f,angle(Fr_Fm_pzt)*180/pi)
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 f(end) -180 180]);yticks(-180:90:180)
legend('F_{mv}','F_{mp}','Location','SouthWest')

figure(12)
subplot(211)
semilogx(f,20*log10(abs(Fr_Pd_vcm_all(:,1:7))))
hold on
semilogx(f,20*log10(abs(Fr_Pd_vcm_all(:,8:9))),'--')
hold off
title('P_{dv}');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 1/Ts/2 -90 10])
subplot(212)
semilogx(f,mod(angle(Fr_Pd_vcm_all(:,1:7))*180/pi+360,360)-360)
hold on
semilogx(f,mod(angle(Fr_Pd_vcm_all(:,8:9))*180/pi+360,360)-360,'--')
hold off
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 1/Ts/2 -360 0]);yticks(-360:90:0)
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')

figure(13)
subplot(211)
semilogx(f,20*log10(abs(Fr_Pd_pzt_all(:,1:7))))
hold on
semilogx(f,20*log10(abs(Fr_Pd_pzt_all(:,8:9))),'--')
hold off
title('P_{dp}');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 1/Ts/2 -25 5])
subplot(212)
semilogx(f,angle(Fr_Pd_pzt_all(:,1:7))*180/pi)
hold on
semilogx(f,angle(Fr_Pd_pzt_all(:,8:9))*180/pi,'--')
hold off
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 1/Ts/2 -180 180]);yticks(-180:90:180)
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')

figure(14)
subplot(211)
semilogx(f,20*log10(abs(Fr_Cd_vcm)))
title('C_{dv}');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e1 1/Ts/2 0 30])
subplot(212)
semilogx(f,angle(Fr_Cd_vcm)*180/pi)
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e1 1/Ts/2 -180 180]);yticks(-180:90:180)

figure(13)
subplot(211)
semilogx(f,20*log10(abs(Fr_Cd_pzt)))
title('C_{dp}');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 1/Ts/2 -20 10])
subplot(212)
semilogx(f,angle(Fr_Cd_pzt)*180/pi)
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 1/Ts/2 -180 180]);yticks(-180:90:180)

figure(15)
subplot(211)
semilogx(f,20*log10(abs(Fr_L(:,1:7))))
hold on
semilogx(f,20*log10(abs(Fr_L(:,8:9))),'--')
hold off
title('Openloop (Bode plot)');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e3 1/Ts/2 -30 30])
subplot(212)
semilogx(f,mod(angle(Fr_L(:,1:7))*180/pi+360,360)-360)
hold on
semilogx(f,mod(angle(Fr_L(:,8:9))*180/pi+360,360)-360,'--')
hold off
xlabel('Frequency [Hz]');ylabel('Phase [deg.]');grid;axis([1e3 1/Ts/2 -360 0]);yticks(-360:90:0)
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')

figure(16)
plot(real(Fr_L(1:find(f>1/Ts/2,1),1:7)),imag(Fr_L(1:find(f>1/Ts/2,1),1:7)))
hold on
plot(real(Fr_L(1:find(f>1/Ts/2,1),8:9)),imag(Fr_L(1:find(f>1/Ts/2,1),8:9)),'--')
hold off
axis equal;
title('Openloop (Nyquist plot)');xlabel('Real axis');ylabel('Imaginary axis');grid;axis([-7 7 -5 5]);
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')

figure(17)
semilogx(f,20*log10(abs(Fr_S(:,1:7))))
hold on
semilogx(f,20*log10(abs(Fr_S(:,8:9))),'--')
hold off
title('Sensitivity function');xlabel('Frequency [Hz]');ylabel('Gain [dB]');grid;axis([1e2 1/Ts/2 -50 10])
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','NorthWest')
