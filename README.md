This project is a Matlab to python translation of the Matlab file: Magnetic-head positioning control system in HDDs
Takenori Atsumi (2024). Magnetic-head positioning control system in HDDs (https://www.mathworks.com/matlabcentral/fileexchange/111515-magnetic-head-positioning-control-system-in-hdds), MATLAB Central File Exchange
Which is based on the the reference paper: T. Atsumi and S. Yabui, 
“Quadruple-Stage Actuator System for Magnetic-Head Positioning System 
in HDDs”, The IEEE Transactions on Industrial Electronics, 
Vol. 67, No. 11, pp. 9184-9194, (2020-11), DOI: 10.1109/TIE.2019.2955432


## Repository Structure 
.
└── HDDBenchmarkProblem-main
    ├── Data_RRO.txt
    ├── Fre_Resp.json
    ├── README.md
    ├── __pycache__
    │   ├── Function_simulation.cpython-311.pyc
    │   ├── Tools.cpython-310.pyc
    │   ├── data_fm.cpython-311.pyc
    │   ├── demo.cpython-311.pyc
    │   ├── plant.cpython-310.pyc
    │   ├── tools.cpython-311.pyc
    │   └── utils.cpython-310.pyc
    ├── demo
    │   └── README.md
    ├── function_simulation.py
    ├── license.txt
    ├── plant.py
    ├── plot_control_system.py
    ├── plot_result
    │   ├── figure10_The_Frequency_Response_of_Pc_pzt.png
    │   ├── figure11_Multi-rate_filter.png
    │   ├── figure12_The_Frequency_Response_of_Pd_vcm.png
    │   ├── figure13_The_Frequency_Response_of_Pd_pzt.png
    │   ├── figure14_The_Frequency_Response_of_Cd_vcm.png
    │   ├── figure15_The_Frequency_Response_of_Cd_vcm.png
    │   ├── figure16_Openloop(Bode Plot).png
    │   ├── figure18_Sensitive_Function.png
    │   ├── figure1_Amplitude_spectrum_of_df.png
    │   ├── figure2_Amplitude_spectrum_of_dp.png
    │   ├── figure3_dRRO.png
    │   ├── figure4_ypc.png
    │   ├── figure5_Max_of_abs(ycp).png
    │   ├── figure6_yc.png
    │   ├── figure7_Amplitude_spectrum_of_yc.png
    │   ├── figure8_3_sigma_of_yc.png
    │   └── figure9_The_Frequency_Response_of_Pc_vcm.png
    ├── requirements.txt
    ├── simulate_trackfollow.py
    └── utils.py

#### Data Files:
- `Data_RRO.txt`: Stores Repeatable Run-Out (RRO) data for function simulation.
- `Fre_Resp.json`: Contains frequency response data.

#### Python Scripts:
- `function_simulation.py`: Executes HDD simulations based on scenarios defined in `plant.py` and saves the outputs to a designated folder. This process may be time-consuming.
- `plant.py`: Specifies the dynamics of the plant being simulated.
- `utils.py`: Includes additional data definitions and utility functions supporting the simulations.
- `plot_control_system.py`: Visualizes the frequency responses of the control system.
- `simulate_trackfollow.py`: Displays simulation outcomes, requiring prior generation of simulation result files.

#### Plot Results:
- The `plot_result` folder houses various figures illustrating the frequency response and other analytical results of the simulations, such as amplitude spectra and Bode plots.

#### Documentation and Other Files:
- `README.md`: Provides an overview and instructions for utilizing the repository.
- `license.txt`: Contains the licensing information.
- `requirements.txt`: Lists the Python package dependencies needed to run the simulations and analyses.

#### Cache and Miscellaneous:
- The `__pycache__` directory caches Python bytecode, speeding up subsequent executions of the scripts.
- Additional `README.md` files may be found in subdirectories like `demo`, offering specific guidance or demonstrations related to the project.

This structure is modeled closely after the Matlab reference, with scripts and data organized to facilitate easy navigation and understanding of the HDD benchmark problem simulations and their analyses.


Installation:
todo

Environment:
This project was tested on python 3.11.0
numpy==1.23.4
control==0.9.4
scipy==1.11.3
matplotlib==3.7.0

Running: todo

1. Download the code.

2. Unzip it.

3. Install the environment by the following command:
    pip install -r environments.txt

4(a). If you only want to plot the simulation results, you must first have run the controller simulation. 
      run the 'simulate_trackfollow.py' by using the following command:
    python simulate_trackfollow.py

4(b). If you want to plot the frequency response, 
      run the 'Plot_ControlSystem_.py' by using the following command:
    python Plot_ControlSystem_.py

4(c). If you want to simulation the controller,
      run the 'Function_Simulation.py' by using the following command: 
    python Function_Simulation.py
