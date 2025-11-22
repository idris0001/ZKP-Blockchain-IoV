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

- run_full_system.m: Runs full ZK-V2XChain framework with all modules active.
  - Outputs: Combined metrics from RSP, ZKP, and Blockchain
