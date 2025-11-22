## Ablation Study Results

This repository includes ablation experiments isolating the contributions of RSP, ZKP, and Blockchain components.

### Folder: `results/ablation/`
- `rsp_only.csv`: Silent durations and retry metrics for RSP-only.
- `zkp_only.csv`: Retry overhead and entropy for ZKP-only.
- `blockchain_only.csv`: Retry distribution and silent end time for Blockchain-only.
- `full_system.csv`: Combined results for the full ZK-V2XChain framework.

### Reproduction Instructions
1. Clone the repo.
2. Open the provided MATLAB scripts in `scripts/ablation/`.
3. Run the scripts using the included datasets.
4. Use the same simulation parameters listed in this README.

### Software Environment
- **Platform**: Windows 11 Pro (Build 26100)
- **Machine**: Lenovo ThinkPad X1 Yoga Gen 6
- **Processor**: Intel Core i7-1165G7 @ 2.80GHz, 16GB RAM
- **MATLAB Version**: R2024a Update 5 (24.1.0.2653294), 64-bit (win64), released June 24, 2024

All ablation experiments were conducted using MATLAB only.
