# Ablation Scripts

This folder contains driver scripts for ablation experiments:

- run_rsp_only.m: Runs ablation experiment with only RSP enabled.
  - Blockchain validation delay: 0.5 seconds
  - Outputs: Silent duration and silent end time per vehicle

- run_zkp_only.m: Runs ablation experiment with only ZKP enabled.
  - Retry limit: [state actual number here if implemented]
  - Outputs: Retry overhead and entropy metrics

- run_blockchain_only.m: Runs ablation experiment with only Blockchain enabled.
  - Outputs: Retry distribution and validation timing

- - **run_full_system.m**  
  Runs full ZK-V2XChain framework with all modules active (RSP, ZKP, and Blockchain).  
  - Uses: All core modules from `scripts/core/`  
  - Ablation: Evaluates the combined impact of all modules on system behavior  
  - Outputs (recorded in `full_system_log.csv`):  
    - Vehicle identifier (`VehicleNumber`)  
    - Silent duration per vehicle (`SilentDuration_sec`)  
    - Silent end time per vehicle (`SilentEndTime_sec`)  
  - Logs: Simulation progress messages and validation steps  
  - Example usage:  
    ```matlab
    > run_full_system(5, 5, 15, 60);
    ```
    Parameters:  
    - 5 vehicles with RSP enabled  
    - 5 vehicles with ZKP enabled  
    - 15 blockchain validation attempts  
    - 60 seconds simulation time
