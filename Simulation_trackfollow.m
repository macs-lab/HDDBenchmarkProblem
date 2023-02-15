clc;clear;close all

%% Cotrolled object
Plant
Tp=5.2697e-8; % 482 kTPI; 

%% Feedback Controller
load Data_Cd.mat

%% Multi-rate filter
load Data_Fm.mat

%% Simulation
sim_result_c1=Function_simulation(Sys_Pc_vcm_c1,Sys_Pc_pzt_c1,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c2=Function_simulation(Sys_Pc_vcm_c2,Sys_Pc_pzt_c2,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c3=Function_simulation(Sys_Pc_vcm_c3,Sys_Pc_pzt_c3,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c4=Function_simulation(Sys_Pc_vcm_c4,Sys_Pc_pzt_c4,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c5=Function_simulation(Sys_Pc_vcm_c5,Sys_Pc_pzt_c5,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c6=Function_simulation(Sys_Pc_vcm_c6,Sys_Pc_pzt_c6,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c7=Function_simulation(Sys_Pc_vcm_c7,Sys_Pc_pzt_c7,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c8=Function_simulation(Sys_Pc_vcm_c8,Sys_Pc_pzt_c8,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);
sim_result_c9=Function_simulation(Sys_Pc_vcm_c9,Sys_Pc_pzt_c9,Sys_Cd_vcm,Sys_Fm_vcm,Sys_Cd_pzt,Sys_Fm_pzt,Ts,Mr_f);


%% Figure
figure(1)
semilogx(sim_result_c1.freq,20*log10(abs(sim_result_c1.Fr_df)))
title('Amplitude spectrum of d_f');xlabel('Frequency [Hz]');ylabel('Amplitude [dB]');grid;xlim([10,1/Ts/2])

figure(2)
semilogx(sim_result_c1.freq,20*log10(abs(sim_result_c1.Fr_dp)))
title('Amplitude spectrum of d_p');xlabel('Frequency [Hz]');ylabel('Amplitude [dB]');grid;xlim([10,1/Ts/2])

figure(3)
plot(sim_result_c1.time(1:420*20)*1e3,sim_result_c1.dRRO(1:420*20)*1e9)
title('d_{RRO}');xlabel('Time [ms]');ylabel('Amplitude [nm]');grid;xlim([0,Ts*420*1e3])

figure(4)
plot(sim_result_c1.time*1e3,sim_result_c1.yc_pzt*1e9)
hold on
plot(sim_result_c2.time*1e3,sim_result_c2.yc_pzt*1e9)
plot(sim_result_c3.time*1e3,sim_result_c3.yc_pzt*1e9)
plot(sim_result_c4.time*1e3,sim_result_c4.yc_pzt*1e9)
plot(sim_result_c5.time*1e3,sim_result_c5.yc_pzt*1e9)
plot(sim_result_c6.time*1e3,sim_result_c6.yc_pzt*1e9)
plot(sim_result_c7.time*1e3,sim_result_c7.yc_pzt*1e9)
plot(sim_result_c8.time*1e3,sim_result_c8.yc_pzt*1e9,'--')
plot(sim_result_c9.time*1e3,sim_result_c9.yc_pzt*1e9,'--')
hold off
title('y_{pc}');xlabel('Time [ms]');ylabel('Amplitude [nm]');grid;
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','SouthWest')

figure(5)
plot([1:9],1e9*max(abs([sim_result_c1.yc_pzt;sim_result_c2.yc_pzt;sim_result_c3.yc_pzt;sim_result_c4.yc_pzt;sim_result_c5.yc_pzt;sim_result_c6.yc_pzt;sim_result_c7.yc_pzt;sim_result_c8.yc_pzt;sim_result_c9.yc_pzt].')),'o')
title('Max of |y_{cp}|');xlabel('Case number');ylabel('Value [nm]');grid

figure(6)
plot(sim_result_c1.time*1e3,sim_result_c1.yc*1e9)
hold on
plot(sim_result_c2.time*1e3,sim_result_c2.yc*1e9)
plot(sim_result_c3.time*1e3,sim_result_c3.yc*1e9)
plot(sim_result_c4.time*1e3,sim_result_c4.yc*1e9)
plot(sim_result_c5.time*1e3,sim_result_c5.yc*1e9)
plot(sim_result_c6.time*1e3,sim_result_c6.yc*1e9)
plot(sim_result_c7.time*1e3,sim_result_c7.yc*1e9)
plot(sim_result_c8.time*1e3,sim_result_c8.yc*1e9,'--')
plot(sim_result_c9.time*1e3,sim_result_c9.yc*1e9,'--')
hold off
title('y_c');xlabel('Time [ms]');ylabel('Amplitude [% of Track width]');grid
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','SouthWest')

figure(7)
semilogx(sim_result_c1.freq,20*log10(abs(sim_result_c1.Fr_yc)))
hold on
semilogx(sim_result_c2.freq,20*log10(abs(sim_result_c2.Fr_yc)))
semilogx(sim_result_c3.freq,20*log10(abs(sim_result_c3.Fr_yc)))
semilogx(sim_result_c4.freq,20*log10(abs(sim_result_c4.Fr_yc)))
semilogx(sim_result_c5.freq,20*log10(abs(sim_result_c5.Fr_yc)))
semilogx(sim_result_c6.freq,20*log10(abs(sim_result_c6.Fr_yc)))
semilogx(sim_result_c7.freq,20*log10(abs(sim_result_c7.Fr_yc)))
semilogx(sim_result_c8.freq,20*log10(abs(sim_result_c8.Fr_yc)),'--')
semilogx(sim_result_c9.freq,20*log10(abs(sim_result_c9.Fr_yc)),'--')
hold off
title('Amplitude spectrum of y_c');xlabel('Frequency [Hz]');ylabel('Amplitude [dB]');grid;xlim([10,50e3])
legend('Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9','Location','SouthWest')

figure(8)
plot([1:9],3*std([sim_result_c1.yc;sim_result_c2.yc;sim_result_c3.yc;sim_result_c4.yc;sim_result_c5.yc;sim_result_c6.yc;sim_result_c7.yc;sim_result_c8.yc;sim_result_c9.yc].')/Tp*100,'o')
title('3\sigma of y_c');xlabel('Case number');ylabel('Value [% of Track width]');grid
