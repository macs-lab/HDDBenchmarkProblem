import control as co
from control import matlab
import numpy as np
import matplotlib.pyplot as plt
import json
import os


# make sure we have the output locations made
plot_output_folder_name = "plot_result"
simulation_cache_folder_name = "simulation_result"

if not os.path.exists(os.path.join(os.getcwd(), plot_output_folder_name)):
    os.makedirs(os.path.join(os.getcwd(), plot_output_folder_name))
        
if not os.path.exists(os.path.join(os.getcwd(), simulation_cache_folder_name)):
    os.makedirs(os.path.join(os.getcwd(), simulation_cache_folder_name))

def get_plot_path(fname):
    return os.path.join(os.getcwd(), os.path.join(plot_output_folder_name, fname))

def get_sim_path(fname):
    return os.path.join(os.getcwd(), os.path.join(simulation_cache_folder_name, fname))

def get_Sys_Cd_pzt():
    
    A = np.array([[-0.9378, 0.01655, 0.0803, 0.0885, -0.05877],
                  [0, 1.124, -0.7196, 0.3411, -0.2265],
                  [0, 0.5, 0, 0, 0],
                  [0, 0, 0, 0.5258, -0.3492],
                  [0, 0, 0, 0.5, 0]])

    B = np.array([[0.09679],
                  [0.3731],
                  [0],
                  [0.575],
                  [0]])

    C = np.array([0.4578, 0.1285, 0.6235, 0.6871, -0.4563])

    D = np.array([0.7514])

    Ts = 1.9841e-05

    return matlab.ss(A, B, C, D, Ts)


def get_Sys_Cd_vcm():
    
    A = np.array([[0.3698, -0.1788, 0, 0.06347, 0.07123, 0.0108, 0.1905, -0.007906, 0.3993],
                  [0.4453, 0.9419, 0, 0.02063, 0.02315, 0.003512, 0.06192, -0.00257, 0.1298],
                  [0.01809, 0.07891, 1, 0.0008384, 0.0009409, 0.0001427, 0.002516, -0.0001044, 0.005275],
                  [0, 0, 0, -0.9378, 0.06619, 0.01004, 0.177, -0.007347, 0.3711],
                  [0, 0, 0, 0, 1.124, -0.02249, 0.1706, -0.00708, 0.3576],
                  [0, 0, 0, 0, 16, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0.5258, -0.02182, 1.102],
                  [0, 0, 0, 0, 0, 0, 8, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0.2038]])

    B = np.array([[0.004101],
                  [0.001333],
                  [5.417e-05],
                  [-0.0006892],
                  [-0.0006641],
                  [0],
                  [-0.002047],
                  [0],
                  [0.008734]])

    C = np.array([-226.7, -143.1, 3.927, 62.47, 70.11, 10.63, 187.5, -7.782, 393.1])

    D = np.array([4.037])

    Ts = 1.9841e-05

    return matlab.ss(A, B, C, D, Ts)


def get_Sys_Fm_pzt():
    
    A = np.array([[1.088, -0.8294, -0.0265, 0.1441, 0.1051, 0.2489, 0.1747, 0.24, 0.06976, 0.09637],
                  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0.4113, -0.7649, 0.115, 0.2725, 0.1913, 0.2629, 0.0764, 0.1055],
                  [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, -0.2773, -0.4853, 0.2452, 0.337, 0.09793, 0.1353],
                  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, -0.3191, -0.1653, 0.478, 0.6604],
                  [0, 0, 0, 0, 0, 0, 0.5, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, -0.7463, -0.4005],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0.5, 0]])

    B = np.array([[0.08534],
                  [0],
                  [0.09346],
                  [0],
                  [0.1198],
                  [0],
                  [0.5848],
                  [0],
                  [1.],
                  [0]])

    C = np.array([-0.1256, 0.2176, -0.04971, 0.2704, 0.1971, 0.4668, 0.3277, 0.4503, 0.1309, 0.1808])

    D = np.array([0.1601])

    Ts = 9.9206e-06

    return matlab.ss(A, B, C, D, Ts)


def get_Sys_Fm_vcm():
    
    A = np.array([[1.82, -0.9386, -0.01716, 0.01955, -0.02081, 0.03475, -0.0347, 0.07612, -0.0244, 0.1173, 0.007164, 0.08666, 0.00505, 0.04144, 0.01156, 0.04172, 0.04099, 0.07872, 0.03279, 0.04083, 0.0405, 0.04084, 0.0389, 0.03774],
                  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 1.739, -0.9803, -0.01046, 0.01746, -0.01744, 0.03825, -0.01226, 0.05892, 0.0036, 0.04354, 0.002537, 0.02082, 0.005811, 0.02096, 0.0206, 0.03956, 0.01647, 0.02052, 0.02035, 0.02052, 0.01955, 0.01897],
                  [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 1.175, -0.9462, -0.03552, 0.07791, -0.02498, 0.12, 0.007333, 0.0887, 0.005169, 0.04242, 0.01184, 0.04271, 0.04196, 0.08058, 0.03356, 0.04179, 0.04145, 0.04181, 0.03982, 0.03863],
                  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0.8875, -0.8972, -0.02607, 0.1253, 0.007654, 0.09259, 0.005395, 0.04428, 0.01236, 0.04458, 0.0438, 0.08411, 0.03503, 0.04362, 0.04327, 0.04364, 0.04157, 0.04033],
                  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0.4488, -0.6752, 0.01826, 0.2209, 0.01287, 0.1057, 0.02948, 0.1064, 0.1045, 0.2007, 0.08358, 0.1041, 0.1032, 0.1041, 0.09918, 0.09622],
                  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.0882, -0.8504, 0.00686, 0.0563, 0.01571, 0.05668, 0.05569, 0.1069, 0.04454, 0.05547, 0.05502, 0.05548, 0.05285, 0.05127],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.1566, -0.8472, 0.03353, 0.121, 0.1189, 0.2283, 0.09507, 0.1184, 0.1174, 0.1184, 0.1128, 0.1094],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.4247, -0.8346, 0.1276, 0.245, 0.102, 0.1271, 0.1261, 0.1271, 0.1211, 0.1175],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.6766, -0.6694, 0.1213, 0.1511, 0.1499, 0.1511, 0.144, 0.1397],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.29, -0.7876, 0.1644, 0.1658, 0.1579, 0.1532],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.577, -0.7635, 0.1753, 0.17],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.632, -0.7563],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                  ])

    B = np.array([[0.09968],
                  [0],
                  [0.05009],
                  [0],
                  [0.102],
                  [0],
                  [0.1065],
                  [0],
                  [0.2541],
                  [0],
                  [0.1354],
                  [0],
                  [0.289],
                  [0],
                  [0.3103],
                  [0],
                  [0.3688],
                  [0],
                  [0.4047],
                  [0],
                  [0.4491],
                  [0],
                  [0.5],
                  [0]])

    C = np.array([-0.1736, 0.1852, -0.06698, 0.07632, -0.08124, 0.1356, -0.1354, 0.2971, -0.09525, 0.4577, 0.02796, 0.3382, 0.01971, 0.1618, 0.04514, 0.1628, 0.16, 0.3073, 0.128, 0.1594, 0.1581, 0.1594, 0.1519, 0.1473])

    D = np.array([0.3891])

    Ts = 9.9206e-06

    return matlab.ss(A, B, C, D, Ts)

def dts_resampling(sys, n):
    A = np.array(sys.A)
    B = np.array(sys.B)
    C = np.array(sys.C)
    D = np.array(sys.D)
    Ts = sys.dt

    Az = np.array([[i for i in j] for j in A])
    Bz = np.array([[i for i in j] for j in B])
    for i in range(1, n):
        Bz = Bz + Az@B
        Az = Az@A
    return matlab.ss(Az, Bz, C, D, Ts*n)


def freqresp(sys_list, freq):

    if isinstance(sys_list, list):
        pass
    else:
        sys_list = [sys_list]
    reps_list = []

    for sys in sys_list:
        mag, phase, w = co.freqresp(sys, freq)
        reps = np.array([mag[i]*complex(np.cos(phase[i]), np.sin(phase[i])) for i in range(mag.shape[0])])
        reps_list.append(reps)

    return np.stack(reps_list, axis=1)




def get_Freq_Resp(file_name, Fr_Resp_Type):
    Fr_Resp_all = {}

    with open(file_name, 'r') as f:
        Fr_Resp_Json = json.load(f)

    for Fr_Resp_Item in Fr_Resp_Type:
        Fr_Resp = []
        Fr_Resp_Mag = Fr_Resp_Json[Fr_Resp_Item + '_mag']
        Fr_Resp_Phase = Fr_Resp_Json[Fr_Resp_Item + '_phase']

        for i in range(len(Fr_Resp_Mag)):
            Fr_Resp.append([])
            for j in range(len(Fr_Resp_Mag[i])):
                mag = Fr_Resp_Mag[i][j]
                phase = Fr_Resp_Phase[i][j]
                Fr_Resp[i].append(complex(mag*np.cos(phase), mag*np.sin(phase)))
        
        Fr_Resp_all[Fr_Resp_Item] = np.array(Fr_Resp)

    return Fr_Resp_all


def Freq_Resp_Plot(Fr_Resp_all_Mag, Fr_Resp_all_Phase, Freq, name, phase_range=(-360, 90), save_path=None):

    title = name

    fig, ax = plt.subplots(2,1, sharex='col', figsize = (24, 12))
    fig.suptitle(title, fontsize=22, weight='bold', family='Times New Roman')
    plt.xticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.yticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.xscale('log')
    l1 = []
    l2 = []
    label = []

    for i in range(Fr_Resp_all_Mag.shape[0]):

        Fr_Resp_Mag = Fr_Resp_all_Mag[i]
        Fr_Resp_Phase = Fr_Resp_all_Phase[i]

        # The setting of subfigure 1
        ax1 = ax[0]
        
        ax1.set_ylabel("Gain [dB]", fontdict={'family': 'Times New Roman',
                                                'size' : 18, 'weight': 'bold'}) 
        
        plt.sca(ax[0])
        plt.yticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
        
        # The setting of subfigure 2
        ax2 = ax[1]
        
        ax2.set_xlabel("Frequency [Hz]", fontdict={'family': 'Times New Roman',
                                                'size' : 18, 'weight': 'bold'}) 
        ax2.set_ylabel("Phase [deg.]", fontdict={'family': 'Times New Roman',
                                                'size' : 18, 'weight': 'bold'})
        
        plt.sca(ax[1])
        y_major_locator = plt.MultipleLocator(90)
        ax2.yaxis.set_major_locator(y_major_locator)
        plt.ylim(phase_range[0], phase_range[1])

        if i > 5:

            l, = ax1.plot(Freq, Fr_Resp_Mag, linestyle="--")
            l1.append(l)

            l, = ax2.plot(Freq, Fr_Resp_Phase, linestyle="--")
            l2.append(l)

        else:

            l, = ax1.plot(Freq, Fr_Resp_Mag, linestyle="-")
            l1.append(l)

            l, = ax2.plot(Freq, Fr_Resp_Phase, linestyle="-")
            l2.append(l)
        
        label.append('Case '+ str(i+1))
    if len(l2)>1:  
        ax2.legend(handles=l2, 
                labels=label,
                loc="lower left", 
                prop={'family': 'Times New Roman', 'size': 16, 'weight': 'bold'}
                )
    
    if save_path != None:
        plt.savefig(save_path)


def Nyquist_Plot(Fr_Resp_all_real, Fr_Resp_all_imag, title, save_path=None):

    fig, ax = plt.subplots(1,2, sharex='col', figsize = (24, 12))
    fig.suptitle(title, fontsize=22, weight='bold', family='Times New Roman')
    plt.xticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.yticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})

    ax1 = ax[0]
    ax1.set_title('Openloop (Nyquist Plot) Overall', fontsize=22, weight='bold', family='Times New Roman')
    ax1.set_xlabel("Real Axis", fontdict={'family': 'Times New Roman',
                                          'size' : 18, 'weight': 'bold'}) 
    ax1.set_ylabel("Imaginary Axis", fontdict={'family': 'Times New Roman',
                                               'size' : 18, 'weight': 'bold'})
    
    ax2 = ax[1]
    ax2.set_title('Openloop (Nyquist Plot) Detail', fontsize=22, weight='bold', family='Times New Roman')
    ax2.set_xlabel("Real Axis", fontdict={'family': 'Times New Roman',
                                          'size' : 18, 'weight': 'bold'}) 
    ax2.set_ylabel("Imaginary Axis", fontdict={'family': 'Times New Roman',
                                               'size' : 18, 'weight': 'bold'})
    plt.sca(ax[1])
    x_major_locator = plt.MultipleLocator(2)
    ax2.xaxis.set_major_locator(x_major_locator)
    plt.xlim(-7, 7)

    y_major_locator = plt.MultipleLocator(2)
    ax2.yaxis.set_major_locator(y_major_locator)
    plt.ylim(-5, 5)

    L1 = []
    L2 = []
    label = []

    for i in range(len(Fr_Resp_all_real)):

        Fr_Resp_real_all = Fr_Resp_all_real[i]
        Fr_Resp_imag_all = Fr_Resp_all_imag[i]
        
        if i > 5:
            l, = ax1.plot(Fr_Resp_real_all, Fr_Resp_imag_all, linestyle="--")
            L1.append(l)

        else:
            l, = ax1.plot(Fr_Resp_real_all, Fr_Resp_imag_all, linestyle="-")
            L1.append(l)
        
        for j in range(1, len(Fr_Resp_real_all)):
            if abs(Fr_Resp_real_all[-j]) > 7 or abs(Fr_Resp_imag_all[-j]) > 5:
                d_index = j
                break
        
        Fr_Resp_real_detail = Fr_Resp_real_all[-d_index:]
        Fr_Resp_imag_detail = Fr_Resp_imag_all[-d_index:]

        if i > 5:
            l, = ax2.plot(Fr_Resp_real_detail, Fr_Resp_imag_detail, linestyle="--")
            L2.append(l)

        else:
            l, = ax2.plot(Fr_Resp_real_detail, Fr_Resp_imag_detail, linestyle="-")
            L2.append(l)
        
        label.append('Case '+ str(i+1))
        
    ax1.legend(handles=L1, 
               labels=label,
               loc="lower left", 
               prop={'family': 'Times New Roman', 'size': 16, 'weight': 'bold'}
            )

    ax2.legend(handles=L2, 
               labels=label,
               loc="lower left", 
               prop={'family': 'Times New Roman', 'size': 16, 'weight': 'bold'}
            ) 
    
    if save_path != None:
        plt.savefig(save_path)


def Sensitive_Function_Plot(Fr_Resp_all_Mag, Freq, name, save_path=None):

    title = name

    fig, ax = plt.subplots(1,1, figsize = (16, 12))
    fig.suptitle(title, fontsize=22, weight='bold', family='Times New Roman')
    plt.xticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.yticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.xscale('log')
    l1 = []
    label = []

    for i in range(Fr_Resp_all_Mag.shape[0]):

        Fr_Resp_Mag = Fr_Resp_all_Mag[i]        
        ax.set_xlabel("Frequency [Hz]", fontdict={'family': 'Times New Roman',
                                                'size' : 18, 'weight': 'bold'}) 
        ax.set_ylabel("Gain [dB]", fontdict={'family': 'Times New Roman',
                                                'size' : 18, 'weight': 'bold'}) 

        if i > 5:
            l, = ax.plot(Freq, Fr_Resp_Mag, linestyle="--")
            l1.append(l)

        else:
            l, = ax.plot(Freq, Fr_Resp_Mag, linestyle="-")
            l1.append(l)

        label.append('Case '+ str(i+1))
        
    ax.legend(handles=l1, 
               labels=label,
               loc="upper left", 
               prop={'family': 'Times New Roman', 'size': 16, 'weight': 'bold'}
            )
    
    if save_path != None:
        plt.savefig(save_path)


def Multi_Rate_Filter_Plot(Fr_Resp_1_Mag, Fr_Resp_1_Phase, Fr_Resp_2_Mag, Fr_Resp_2_Phase, Freq, name, save_path=None):

    title = name

    fig, ax = plt.subplots(2,1, sharex='col', figsize = (16, 12))
    fig.suptitle(title, fontsize=22, weight='bold', family='Times New Roman')
    plt.xticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.yticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})
    plt.xscale('log')
    l1 = []
    l2 = []
    label = ['Fr_Fm$_{vcm}$', 'Fr_Fm$_{pzt}$']

    # The setting of subfigure 1
    ax1 = ax[0]
    
    ax1.set_xlabel("Frequency [Hz]", fontdict={'family': 'Times New Roman',
                                            'size' : 18, 'weight': 'bold'}) 
    ax1.set_ylabel("Gain [dB]", fontdict={'family': 'Times New Roman',
                                            'size' : 18, 'weight': 'bold'}) 
    
    plt.sca(ax[0])
    plt.yticks(font={'family': 'Times New Roman', 'size' : 16, 'weight': 'bold'})

    l, = ax1.plot(Freq, Fr_Resp_1_Mag)
    l1.append(l)
    l, = ax1.plot(Freq, Fr_Resp_2_Mag)
    l1.append(l)

    ax1.legend(handles=l1, 
               labels=label,
               loc="lower left", 
               prop={'family': 'Times New Roman', 'size': 16, 'weight': 'bold'}
               )
    
    # The setting of subfigure 2
    ax2 = ax[1]
    
    ax2.set_xlabel("Frequency [Hz]", fontdict={'family': 'Times New Roman',
                                            'size' : 18, 'weight': 'bold'}) 
    ax2.set_ylabel("Phase [deg.]", fontdict={'family': 'Times New Roman',
                                            'size' : 18, 'weight': 'bold'})
    
    plt.sca(ax[1])
    y_major_locator = plt.MultipleLocator(90)
    ax2.yaxis.set_major_locator(y_major_locator)
    plt.ylim(-180, 180)

    l, = ax2.plot(Freq, Fr_Resp_1_Phase)
    l1.append(l)
    l, = ax2.plot(Freq, Fr_Resp_2_Phase)
    l1.append(l)

    ax2.legend(handles=l1, 
               labels=label,
               loc="lower left", 
               prop={'family': 'Times New Roman', 'size': 16, 'weight': 'bold'}
               )
    
    if save_path != None:
        plt.savefig(save_path)




