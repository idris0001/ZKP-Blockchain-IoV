# Location Privacy Simulation for IoV

## Description
This repository contains source code and simulation scripts used in the study on unconditional location privacy in sparse IoV networks via silent periods, blockchain, and ZKP.

## Contents
- SUMO mobility file (`*.sumo`) based on OpenStreetMap data for realistic vehicle movement simulation  
- NS-3 (v3.45) simulation scripts producing CSV output files with communication and privacy metrics  
- MATLAB scripts for:  
  - Random silent period simulation  
  - Identity Token (IT) request and blockchain interaction simulation  
  - Performance analysis and visualization  

## Setup Instructions
1. Load the SUMO file in the SUMO simulator to generate realistic vehicle mobility traces derived from OpenStreetMap.  
2. Run NS-3 simulations using the provided scripts; simulation results are saved as CSV files for further processing.  
3. Use MATLAB scripts to simulate silent period protocols, blockchain IT requests, and analyze simulation data.

## Notes
- NS-3 version 3.45 is recommended for compatibility.  
- MATLAB R2022a or newer is recommended for running the scripts.

---

*For any questions or issues, please contact:*  
Abdulhameed Idris  
Email: iaabdulhameed@knu.ac.kr  
