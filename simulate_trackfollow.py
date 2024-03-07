import pickle
import numpy as np
import matplotlib.pyplot as plt
import utils
import plant
import sys

Tp=5.2697e-8 # 482 kTPI 

# get Ts from the plant parameters
Ts = plant.Ts

# Simulation
try:
    sim_result_c1 = pickle.load(open(utils.get_sim_path("res1.pkl"), "rb"))
    sim_result_c2 = pickle.load(open(utils.get_sim_path("res2.pkl"), "rb"))
    sim_result_c3 = pickle.load(open(utils.get_sim_path("res3.pkl"), "rb"))
    sim_result_c4 = pickle.load(open(utils.get_sim_path("res4.pkl"), "rb"))
    sim_result_c5 = pickle.load(open(utils.get_sim_path("res5.pkl"), "rb"))
    sim_result_c6 = pickle.load(open(utils.get_sim_path("res6.pkl"), "rb"))
    sim_result_c7 = pickle.load(open(utils.get_sim_path("res7.pkl"), "rb"))
    sim_result_c8 = pickle.load(open(utils.get_sim_path("res8.pkl"), "rb"))
    sim_result_c9 = pickle.load(open(utils.get_sim_path("res9.pkl"), "rb"))
except Exception as e:
    print("ERROR: Simulation files not found, have you run function_simulation.py first? exiting ...")
    sys.exit()


plt.figure(1)
plt.semilogx(sim_result_c1["freq"],20*np.log10(np.abs(sim_result_c1["Fr_df"])))
plt.title('Amplitude spectrum of d_f')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')
plt.grid(True)
plt.xlim([10,1/Ts/2])
plt.savefig(utils.get_plot_path("figure1_Amplitude_spectrum_of_df.png"))


plt.figure(2)
plt.semilogx(sim_result_c1["freq"],20*np.log10(np.abs(sim_result_c1["Fr_dp"])))
plt.title('Amplitude spectrum of d_p')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')
plt.grid(True)
plt.xlim([10,1/Ts/2])
plt.savefig(utils.get_plot_path("figure2_Amplitude_spectrum_of_dp.png"))


plt.figure(3)
plt.plot(sim_result_c1["time"][1:420*20]*1e3,sim_result_c1["dRRO"][1:420*20]*1e9)
plt.title('d_{RRO}')
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude [nm]')
plt.grid(True)
plt.xlim([0,Ts*420*1e3])
plt.savefig(utils.get_plot_path("figure3_dRRO.png"))


plt.figure(4)
plt.plot(sim_result_c1["time"]*1e3,sim_result_c1["yc_pzt"]*1e9)
plt.plot(sim_result_c2["time"]*1e3,sim_result_c2["yc_pzt"]*1e9)
plt.plot(sim_result_c3["time"]*1e3,sim_result_c3["yc_pzt"]*1e9)
plt.plot(sim_result_c4["time"]*1e3,sim_result_c4["yc_pzt"]*1e9)
plt.plot(sim_result_c5["time"]*1e3,sim_result_c5["yc_pzt"]*1e9)
plt.plot(sim_result_c6["time"]*1e3,sim_result_c6["yc_pzt"]*1e9)
plt.plot(sim_result_c7["time"]*1e3,sim_result_c7["yc_pzt"]*1e9)
plt.plot(sim_result_c8["time"]*1e3,sim_result_c8["yc_pzt"]*1e9,'--')
plt.plot(sim_result_c9["time"]*1e3,sim_result_c9["yc_pzt"]*1e9,'--')
plt.title('y_{pc}')
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude [nm]')
plt.grid(True)
plt.legend(['Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9'], loc="lower left")
plt.savefig(utils.get_plot_path("figure4_ypc.png"))


plt.figure(5)
res = np.array([
    sim_result_c1["yc_pzt"],
    sim_result_c2["yc_pzt"],
    sim_result_c3["yc_pzt"],
    sim_result_c4["yc_pzt"],
    sim_result_c5["yc_pzt"],
    sim_result_c6["yc_pzt"], 
    sim_result_c7["yc_pzt"],
    sim_result_c8["yc_pzt"],
    sim_result_c9["yc_pzt"]
]).transpose()
plt.plot(np.arange(1,10), 1e9*np.max(np.abs(res), axis = 0),'o')
plt.title('Max of |y_{cp}|')
plt.xlabel('Case number')
plt.ylabel('Value [nm]')
plt.grid(True)
plt.savefig(utils.get_plot_path("figure5_Max_of_abs(ycp).png"))


plt.figure(6)
plt.plot(sim_result_c1["time"]*1e3,sim_result_c1["yc"]*1e9)
plt.plot(sim_result_c2["time"]*1e3,sim_result_c2["yc"]*1e9)
plt.plot(sim_result_c3["time"]*1e3,sim_result_c3["yc"]*1e9)
plt.plot(sim_result_c4["time"]*1e3,sim_result_c4["yc"]*1e9)
plt.plot(sim_result_c5["time"]*1e3,sim_result_c5["yc"]*1e9)
plt.plot(sim_result_c6["time"]*1e3,sim_result_c6["yc"]*1e9)
plt.plot(sim_result_c7["time"]*1e3,sim_result_c7["yc"]*1e9)
plt.plot(sim_result_c8["time"]*1e3,sim_result_c8["yc"]*1e9,'--')
plt.plot(sim_result_c9["time"]*1e3,sim_result_c9["yc"]*1e9,'--')
plt.title('y_c')
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude [\% of Track width]')
plt.grid(True)
plt.legend(['Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9'], loc="lower left")
plt.savefig(utils.get_plot_path("figure6_yc.png"))


plt.figure(7)
plt.semilogx(sim_result_c1["freq"],20*np.log10(np.abs(sim_result_c1["Fr_yc"])))
plt.semilogx(sim_result_c2["freq"],20*np.log10(np.abs(sim_result_c2["Fr_yc"])))
plt.semilogx(sim_result_c3["freq"],20*np.log10(np.abs(sim_result_c3["Fr_yc"])))
plt.semilogx(sim_result_c4["freq"],20*np.log10(np.abs(sim_result_c4["Fr_yc"])))
plt.semilogx(sim_result_c5["freq"],20*np.log10(np.abs(sim_result_c5["Fr_yc"])))
plt.semilogx(sim_result_c6["freq"],20*np.log10(np.abs(sim_result_c6["Fr_yc"])))
plt.semilogx(sim_result_c7["freq"],20*np.log10(np.abs(sim_result_c7["Fr_yc"])))
plt.semilogx(sim_result_c8["freq"],20*np.log10(np.abs(sim_result_c8["Fr_yc"])),'--')
plt.semilogx(sim_result_c9["freq"],20*np.log10(np.abs(sim_result_c9["Fr_yc"])),'--')
plt.title('Amplitude spectrum of y_c')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')
plt.grid(True)
plt.xlim([10,50e3])
plt.legend(['Case 1','Case 2','Case 3','Case 4','Case 5','Case 6','Case 7','Case 8','Case 9'], loc="lower left")
plt.savefig(utils.get_plot_path("figure7_Amplitude_spectrum_of_yc.png"))


plt.figure(8)
res = 3*np.std(np.array([
    sim_result_c1["yc"],
    sim_result_c2["yc"],
    sim_result_c3["yc"],
    sim_result_c4["yc"],
    sim_result_c5["yc"],
    sim_result_c6["yc"],
    sim_result_c7["yc"],
    sim_result_c8["yc"],
    sim_result_c9["yc"]
]), axis = 1).transpose()
plt.plot(np.arange(1,10),res/Tp*100,'o')
plt.title('3 sigma of y_c')
plt.xlabel('Case number')
plt.ylabel('Value [\% of Track width]')
plt.grid(True)
plt.savefig(utils.get_plot_path("figure8_3_sigma_of_yc.png"))