# Gatling V1: Photonic Tensor Accelerator

**A grassroots response to the AI Energy Crisis.**

The Gatling V1 is an open-source, high-density optical computing engine built using off-the-shelf components. While the industry giants are reopening nuclear plants to power traditional silicon, we are utilizing the physics of light to perform massive parallel matrix multiplication at a fraction of the power cost.



## 1. The Core Insight: Logic in the Flippers
Traditional GPUs are limited by **Temporal Scaling** (clock speeds). The Gatling V1 utilizes **Spatial Scaling**. 
* **The Multiplier:** A Digital Micromirror Device (DMD) acting as a spatial light modulator.
* **The Adder:** A passive convex lens that performs summation via photonic superposition (zero-latency).
* **The Result:** High-speed InGaAs sensors that capture the vector result at 100MHz.

## 2. Technical Specifications (Phase 1 Prototype)
| Component | Specification |
| :--- | :--- |
| **Core Processor** | TI DLP3010 DMD (Micromirror Array) |
| **Spectral Range** | 1000nm - 1600nm (NIR) |
| **Sampling Rate** | 100 MSPS (via ADS52J90) |
| **Control Logic** | Xilinx Zynq-7000 SoC (Arty Z7-20) |
| **Power Envelope** | < 60 Watts |



## 3. Developer Interface: Memory Map
The Gatling Engine is exposed to the Zynq ARM processor as a memory-mapped peripheral via AXI-Lite.

**Base Address:** `0x43C00000`

| Offset | Register | Access | Description |
| :--- | :--- | :--- | :--- |
| `0x00-0x3C`| **CH_00-15** | RO | Photonic Result: Sensors (0,0) through (3,3) |
| `0x40` | **CONTROL** | RW | Bit 0: Trigger Capture |
| `0x44` | **STATUS** | RO | Bit 0: Capture Complete / Data Valid |



## 4. Why This Exists
Modern AI is hitting a "Power Wall." We believe the solution isn't "better" silicon, but **smarter physics**. 
1. **No Lab-Tech Required:** We don't use custom-etched photonics. We use parts you can buy on DigiKey or rip out of a projector.
2. **Zero-Heat Summation:** Adding 1,000 numbers in silicon generates heat. Adding 1,000 rays of light in a lens generates **zero heat**.
3. **Decentralized AI:** By lowering the power and cost of inference, we move AI from massive server farms back to the edge.



## 5. Getting Started
* See `/docs/analysis/compute_density.md` for the mathematical proof of equivalent throughput.
* See `/hardware/hdl/` for the Verilog capture engine and AXI wrappers.
* See `/scripts/calibration/` for the linearity proof script.

---
**The Challenge:** We aren't waiting for the future. We're building it with what's on the table.
