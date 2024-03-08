# Magnetic-Head Positioning Control System in HDDs - Python Version

This project serves as a Python adaptation of Takenori Atsumi's original Matlab project, "Magnetic-head Positioning Control System in HDDs." The Matlab version can be found on the MATLAB Central File Exchange, uploaded in 2024, and is available through the following link: [Magnetic-head Positioning Control System in HDDs](https://www.mathworks.com/matlabcentral/fileexchange/111515-magnetic-head-positioning-control-system-in-hdds).

The adaptation is inspired by and based on the research and methodologies outlined in the reference paper by T. Atsumi and S. Yabui, titled "Quadruple-Stage Actuator System for Magnetic-Head Positioning System in HDDs." This paper was published in The IEEE Transactions on Industrial Electronics, Volume 67, Issue 11, on pages 9184-9194, in November 2020. The DOI for this paper is: 10.1109/TIE.2019.2955432.



## Repository Structure 

    .
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

# HDD Benchmark Problem Simulation and Analysis

The organization and content of this repository are inspired by a Matlab reference structure, designed to enhance the navigability and understanding of Hard Disk Drive (HDD) benchmark problem simulations and their analyses.

## Installation and Environment Setup

### Environment Requirements
This project is compatible with Python 3.11.0 and requires specific package versions to function correctly:

- numpy 1.23.4
- control 0.9.4
- scipy 1.11.3
- matplotlib 3.7.0

### Setting Up the Environment

Follow these steps to prepare the environment for running the simulations and analyses:

1. **Download and Unzip:**
   - Download the code package and extract its contents.

2. **Install Dependencies:**
   - Use pip to install the necessary Python packages:
     ```bash
     pip install -r requirements.txt
     ```

## Running the Project

To engage with the project's simulation and plotting functionalities, execute the appropriate scripts as follows, depending on your objectives:

- **For Plotting Simulation Results:**
  - Prior execution of the controller simulation is required. Run the following command:
    ```bash
    python simulate_trackfollow.py
    ```

- **For Frequency Response Plotting:**
  - To visualize frequency responses, execute:
    ```bash
    python plot_control_system.py
    ```

- **For Controller Simulation:**
  - For simulating the controller, use the command:
    ```bash
    python function_simulation.py
    ```

This guide is aimed at facilitating a smooth setup and execution process for the HDD benchmark simulation project.
