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
- Entropy analysis: Entropy is computed using log₂(n) per bin; see copy_of_location_entropy.ipynb and Entropy_Calculation_Appendix.md for full details. 

## Setup Instructions
1. Load the SUMO file in the SUMO simulator to generate realistic vehicle mobility traces derived from OpenStreetMap.  
2. Run NS-3 simulations using the provided scripts; simulation results are saved as CSV files for further processing.  
3. Use MATLAB scripts to simulate silent period protocols, blockchain IT requests, and analyze simulation data.

## Notes
- NS-3 version 3.45 is recommended for compatibility.  
- MATLAB R2024a or newer is recommended for running the scripts.

Base Papers
This repository builds upon the following foundational works:
- Benarous and B. Kadri, “Obfuscation-based location privacy-preserving scheme in cloud-enabled internet of vehicles,” Peer-to-Peer Networking and Applications, vol. 15, no. 1, pp. 461–472, 2022.
- Kumari, P. K. Singh, S. N. Gowtham, S. Nandi, U. Ghosh, and D. B. Rawat, “RFPM: A RSU-aided framework for pseudonym management to preserve location privacy in IoV,” Security and Privacy, vol. 7, no. 1, p. e329, 2024.
- Saqib, S. U. Malik, A. Anjum, M. H. Syed, S. A. Moqurrab, G. Srivastava, and J. C.-W. Lin, “Preserving privacy in Internet of Vehicles (IoV): A novel group-leader-based shadowing scheme using blockchain,” IEEE Internet of Things Journal, vol. 10, no. 24, pp. 21421–21430, 2023



---

*For any questions or issues, please contact:*  
Abdulhameed Idris  
Email: iaabdulhameed@knu.ac.kr  
