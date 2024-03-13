# Magnetic-Head Positioning Control System in HDDs - Python Version

This project serves as a Python adaptation of the Hard Disk Drive Servo Control Benchmark: "Magnetic-head Positioning Control System in HDDs," authored by Takenori Atsumi in MATLAB under the Investigating R&D Committee on “Precision Servo Technology for High Value-Added Mechatronic System,” The Institute of Electrical Engineers of Japan.  The Matlab source material can be found on the MATLAB Central File Exchange, uploaded in 2024, and is available through the following link: [Magnetic-head Positioning Control System in HDDs](https://www.mathworks.com/matlabcentral/fileexchange/111515-magnetic-head-positioning-control-system-in-hdds).

The adaptation is inspired by and based on the research and methodologies outlined in the reference paper by T. Atsumi and S. Yabui, titled "Quadruple-Stage Actuator System for Magnetic-Head Positioning System in HDDs." This paper was published in The IEEE Transactions on Industrial Electronics, Volume 67, Issue 11, on pages 9184-9194, in November 2020. The DOI for this paper is: 10.1109/TIE.2019.2955432 and is supported by the Investigating R&D Committee on “Precision Servo Technology for High Value-Added Mechatronic System”, The Institute of Electrical Engineers of Japan.



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
    │   ├── ... Figures
    │ 
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
- An additional `README.md` file may be found in the `demo` subdirectory, which explains the parameters, additional data files and system use cases.

# HDD Benchmark Problem Simulation and Analysis

The organization and content of this repository are inspired by a Matlab reference structure, designed to enhance the navigability and understanding of Hard Disk Drive (HDD) benchmark problem simulations and their analyses.

## Installation and Environment Setup

### Environment Requirements
This project is compatible with Python 3.11.0 and was tested with specific package versions:

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
    python function_simulation.py
    ```

  - To visualize frequency responses, execute:
    ```bash
    python plot_control_system.py
    ```

  - For simulating the controller and visualizing the results, use the command:
    ```bash
    python simulate_trackfollow.py
    ```

  - all code execution outputs to the plot_result subdirectory. This can be set in utils.py
