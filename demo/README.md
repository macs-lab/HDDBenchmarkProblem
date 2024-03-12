P_cv : VCM in continuous-time system, 
P_cp : PZT actuator in continuous-time system
C_dv : Feedback controller for VCM
C_dp : Feedback controller for PZT actuator
F_mv : Multi-rate filter for VCM
F_mp : Multi-rate filter for PZT actuator
I_p : Interpolator, H m : Multi-rate zero-order hold
S : Samper
d_p : Fan-induced vibration
d_f : Rotational vibration (RV)
d_RRO : Repeatable Run-Out (RRO)
y_c : Head position in continuous time
y_d : Head position in discrete time
y_cp : Displacement of PZT actuator

Use Case Description
A selection of system models has been made available for reference. These models can be found in the file plant.py. A total of 9 cases of this system have been included for users to explore. Users can create their own system by defining approximate continuous-time systems, examples being any of the 9 use cases, or adjust the VCM and PZT parameters as indicated in the subsection ‘Plant parameter’.

Parameters of the nominal controlled object are shown in the following paper.
T. Atsumi and S. Yabui, “Quadruple-Stage Actuator System for Magnetic-Head Positioning System in HDDs,”
The IEEE Transactions on Industrial Electronics, Vol. 67, No. 11, pp. 9184-9194, (2020-11)

The use cases in this example system analyze temperature dependencies of mechanical resonant frequencies. They are summarized as follows:
Case 1: LT (low temperature), +4% VCM nominal values, +6% PZT nominal values
Case 2: RT (room temperature)
Case 3: HT (high temperature), -4% VCM nominal values, -6% PZT nominal values
Case 4: +5% Case 1 nominal values
Case 5: +5% Case 2 nominal values
Case 6: +5% Case 3 nominal values
Case 7: -5% Case 1 nominal values
Case 8: -5% Case 2 nominal values
Case 9: -5% Case 3 nominal values

Numerical data from the example system include: 
Data_RRO.txt: d_RRO (Repeatable Run-Out), oscillation of target tracks written on the disk.
Data_Cd: Feedback controllers. Data is translated from mat file Data_Cd.mat. 
In Tools.py, functions get_Sys_Cd_vcm and get_Sys_Cd_pzt.
In Function_Simulation.py, defined as variables Sys_Cd_vcm and Sys_Cd_pzt.
Data_Fm: Multi-rate filters. Data is translated from mat file Data_Fm.mat. 
In Tools.py, functions get_Sys_Fm_vcm and get_Sys_Fm_pzt.
In Function_Simulation.py, defined as variables Sys_Fm_vcm and Sys_Fm_pzt.
