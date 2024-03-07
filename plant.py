import numpy as np
import control as co
from scipy import signal

num_sector = 420                   # Number of sector
num_rpm = 7200                     # Number of RPM
Ts = 1/(num_rpm/60*num_sector)     # Sampling time
Mr_f = 2                           # Multi-rate number

# VCM
Kp_vcm=3.7976e+07
omega_vcm = list(np.array([0, 5300 ,6100 ,6500 ,8050 ,9600 ,14800 ,17400 ,21000 ,26000 ,26600 ,29000 ,32200 ,38300 ,43300 ,44800])*2*np.pi)
kappa_vcm = [1, -1.0 ,+0.1 ,-0.1 ,0.04 ,-0.7 ,-0.2  ,-1.0  ,+3.0  ,-3.2  ,2.1   ,-1.5  ,+2.0  ,-0.2  ,+0.3  ,-0.5 ]
zeta_vcm = [0, 0.02 ,0.04 ,0.02 ,0.01 ,0.03 ,0.01  ,0.02  ,0.02  ,0.012 ,0.007 ,0.01  ,0.03  ,0.01  ,0.01  ,0.01 ]

# PZT
omega_pzt = list(np.array([14800 ,21500 ,28000 ,40200 ,42050,44400,46500 ,100000])*2*np.pi)
kappa_pzt = [-0.005,-0.01 ,-0.1  ,+0.8  ,0.3  ,-0.25  ,0.3  ,10.0 ]
zeta_pzt = [0.025 ,0.03  ,0.05  ,0.008  ,0.008 ,0.01 ,0.02  ,0.3 ]

# LT (case 1)
# VCM
Sys_Pc_vcm_c1 = 0
for i in range(len(omega_vcm)):
    Sys_Pc_vcm_c1_i = co.tf2ss(co.tf([0, 0, kappa_vcm[i]*Kp_vcm], [1, 2*zeta_vcm[i]*0.8*omega_vcm[i]*1.04, (omega_vcm[i]*1.04)**2]))
    Sys_Pc_vcm_c1 =  Sys_Pc_vcm_c1+Sys_Pc_vcm_c1_i

#  PZT
Sys_Pc_pzt_c1=0
for i in range(len(omega_pzt)):
    Sys_Pc_pzt_c1_i = co.tf2ss(co.tf([0, 0, kappa_pzt[i]], 
                                    [1, 2*zeta_pzt[i]*0.8*omega_pzt[i]*1.06, (omega_pzt[i]*1.06)**2]))
    Sys_Pc_pzt_c1 = Sys_Pc_pzt_c1 + Sys_Pc_pzt_c1_i
Sys_Pc_pzt_c1_ss = [Sys_Pc_pzt_c1.A, Sys_Pc_pzt_c1.B, Sys_Pc_pzt_c1.C, Sys_Pc_pzt_c1.D] 	
_, pzt_c1_freqresp = signal.freqresp(Sys_Pc_pzt_c1_ss, np.array([0.]))
Sys_Pc_pzt_c1 = Sys_Pc_pzt_c1/abs(pzt_c1_freqresp)


# RT (Case 2)
# VCM
Sys_Pc_vcm_c2 = 0
for i in range(len(omega_vcm)):
    Sys_Pc_vcm_c2_i = co.tf2ss(co.tf([0, 0, kappa_vcm[i]*Kp_vcm], 
                                    [1, 2*zeta_vcm[i]*omega_vcm[i], omega_vcm[i]**2]))
    Sys_Pc_vcm_c2 = Sys_Pc_vcm_c2 + Sys_Pc_vcm_c2_i

# PZT
Sys_Pc_pzt_c2=0
for i in range(len(omega_pzt)):
    Sys_Pc_pzt_c2_i = co.tf2ss(co.tf([0, 0, kappa_pzt[i]], 
                                [1, 2*zeta_pzt[i]*omega_pzt[i], omega_pzt[i]**2]))
    Sys_Pc_pzt_c2 = Sys_Pc_pzt_c2 + Sys_Pc_pzt_c2_i

Sys_Pc_pzt_c2_ss = [Sys_Pc_pzt_c2.A, Sys_Pc_pzt_c2.B, Sys_Pc_pzt_c2.C, Sys_Pc_pzt_c2.D] 	
_, pzt_c2_freqresp = signal.freqresp(Sys_Pc_pzt_c2_ss, np.array([0.]))
Sys_Pc_pzt_c2 = Sys_Pc_pzt_c2/abs(pzt_c2_freqresp)


# HT (Case 3)
# VCM
Sys_Pc_vcm_c3=0
for i in range(len(omega_vcm)):
    Sys_Pc_vcm_c3_i = co.tf2ss(co.tf([0, 0, kappa_vcm[i]*Kp_vcm], 
                                    [1, 2*zeta_vcm[i]*1.2*omega_vcm[i]*0.96, (omega_vcm[i]*0.96)**2]))
    Sys_Pc_vcm_c3 = Sys_Pc_vcm_c3 + Sys_Pc_vcm_c3_i

# PZT
Sys_Pc_pzt_c3=0
for i in range(len(omega_pzt)):
    Sys_Pc_pzt_c3_i = co.tf2ss(co.tf([0, 0, kappa_pzt[i]], 
                                    [1, 2*zeta_pzt[i]*1.2*omega_pzt[i]*0.94, (omega_pzt[i]*0.94)**2]))
    Sys_Pc_pzt_c3 = Sys_Pc_pzt_c3 + Sys_Pc_pzt_c3_i
Sys_Pc_pzt_c3_ss = [Sys_Pc_pzt_c3.A, Sys_Pc_pzt_c3.B, Sys_Pc_pzt_c3.C, Sys_Pc_pzt_c3.D] 	
_, pzt_c3_freqresp = signal.freqresp(Sys_Pc_pzt_c3_ss, np.array([0.]))
Sys_Pc_pzt_c3 = Sys_Pc_pzt_c3/abs(pzt_c3_freqresp)


# LT / PZT gain +5% (Case 4)
Sys_Pc_vcm_c4 = Sys_Pc_vcm_c1
Sys_Pc_pzt_c4 = Sys_Pc_pzt_c1*1.05


# RT / PZT gain +5% (Case 5)
Sys_Pc_vcm_c5 = Sys_Pc_vcm_c2
Sys_Pc_pzt_c5 = Sys_Pc_pzt_c2*1.05


# HT / PZT gain +5% (Case 6)
Sys_Pc_vcm_c6 = Sys_Pc_vcm_c3
Sys_Pc_pzt_c6 = Sys_Pc_pzt_c3*1.05


# LT / PZT gain -5% (Case 7)
Sys_Pc_vcm_c7 = Sys_Pc_vcm_c1
Sys_Pc_pzt_c7 = Sys_Pc_pzt_c1*0.95


# RT / PZT gain -5% (Case 8)
Sys_Pc_vcm_c8 = Sys_Pc_vcm_c2
Sys_Pc_pzt_c8 = Sys_Pc_pzt_c2*0.95


# HT / PZT gain -5% (Case 9)
Sys_Pc_vcm_c9 = Sys_Pc_vcm_c3
Sys_Pc_pzt_c9 = Sys_Pc_pzt_c3*0.95


Sys_Pc_vcm_all = [Sys_Pc_vcm_c1, Sys_Pc_vcm_c2, Sys_Pc_vcm_c3, 
                Sys_Pc_vcm_c4, Sys_Pc_vcm_c5, Sys_Pc_vcm_c6, 
                Sys_Pc_vcm_c7, Sys_Pc_vcm_c8, Sys_Pc_vcm_c9]

Sys_Pc_pzt_all = [Sys_Pc_pzt_c1, Sys_Pc_pzt_c2, Sys_Pc_pzt_c3, 
                Sys_Pc_pzt_c4, Sys_Pc_pzt_c5, Sys_Pc_pzt_c6, 
                Sys_Pc_pzt_c7, Sys_Pc_pzt_c8, Sys_Pc_pzt_c9]

