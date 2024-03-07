This project is a Matlab to python translation of the Matlab file: Magnetic-head positioning control system in HDDs
Takenori Atsumi (2024). Magnetic-head positioning control system in HDDs (https://www.mathworks.com/matlabcentral/fileexchange/111515-magnetic-head-positioning-control-system-in-hdds), MATLAB Central File Exchange
Which is based on the the reference paper: T. Atsumi and S. Yabui, 
“Quadruple-Stage Actuator System for Magnetic-Head Positioning System 
in HDDs”, The IEEE Transactions on Industrial Electronics, 
Vol. 67, No. 11, pp. 9184-9194, (2020-11), DOI: 10.1109/TIE.2019.2955432



Repository Structure:

HDD-Python
  - Simulation_Result/
  - Plot_Result/
  - api/ todo: make api wrapper
  - plant.py
  - function_simulation.py
  - plot_control_system.py
  - simulate_trackfollow.py
  - utils.py
  - Data_RRO.txt
  
This translation closely follows the Matlab reference.

plant.py: defines plant dynamics
utils.py: other data definitions as well as helper functions
function_simulation.py: runs and stores the HDD simulation for the cases in plant.py. Outputs are written to simulation_result since it will take a while to run
Data_RRO.txt: contains the RRO data for function simulation
plot_control_system.py: plots the frequency responses
simulate_trackfollow.py: plots the simulation results, must already have the simulation result files in the folder.


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