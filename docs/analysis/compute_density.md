# Gatling V1: Compute Density & Equivalent Throughput Analysis

## The "Shannon Divergence"
Standard communication theory (Shannon’s Law) focuses on the **Transmission** of raw bits through a pipe. The Gatling V1 focuses on the **Transformation** of data within the pipe. By moving logic from the Time Domain (clock speed) to the Spatial Domain (mirror array), we achieve high-throughput compute at a fraction of the traditional power cost.

## 1. Work per Pulse (The Core Metric)
In a traditional Von Neumann architecture (CPU/GPU), calculating $y = Wx + b$ is a multi-step serial process. In the Gatling V1, this is a single photonic event.

| Step | Traditional Digital Cycle | Gatling V1 Optical Pulse |
| :--- | :--- | :--- |
| **Fetch** | $W$ and $x$ moved from Cache to ALU | Laser $(x)$ hits DMD $(W)$ |
| **Compute** | Transistors flip to Multiply/Add | Passive reflection and convergence |
| **Store** | Result $y$ written to Register | Photon flux captured by ADC |
| **Total Time** | 4–12 Clock Cycles | **1 Pulse (Time-of-Flight)** |



## 2. Equivalent Clock Speed Calculation
To match the Gatling V1's performance, a digital processor would need to toggle at gigahertz frequencies to overcome its serial bottleneck.

### Scenario: 4x4 Grid (16 Parallel Channels)
* **Physical Clock ($f$):** 32 kHz (The "Gatling" mirror flip rate)
* **Operations per Pulse:** 16 MACs (Multiply-Accumulate) = 32 Ops
* **Throughput:** 32,000 Hz × 32 Ops = **1.024 Million Ops/sec**

### Scenario: High-Density Patch (64x64 Grid)
* **Physical Clock ($f$):** 32 kHz
* **Operations per Pulse:** 4,096 MACs = 8,192 Ops
* **Throughput:** 32,000 Hz × 8,192 Ops = **262.1 Million Ops/sec**

**Digital Equivalent:** To achieve 262M Ops/sec with a single-core serial processor (accounting for 4 cycles of overhead per MAC), the digital chip would need a stable **~1 GHz clock rate.**



## 3. Efficiency Benchmarks (Estimated)

| Metric | Mid-Range GPU (RTX 3060) | Gatling V1 (Prototype) | Advantage |
| :--- | :--- | :--- | :--- |
| **Operational Power** | 170W+ | **~45W - 60W** | ~3x Lower |
| **Math-Logic Power** | High (Transistor Switching) | **Near-Zero (Passive)** | Massive Efficiency |
| **Thermal Output** | High (Requires Active Cooling) | Low (Passive/Air) | Silent/Compact |

## 4. Scaling Efficiency: Spatial vs. Temporal
Unlike traditional silicon, which is limited by the serial clock speed of the ALU, the Gatling V1 scales by utilizing the **Surface Area** of the DMD. Because optical summation occurs via superposition, the latency for a 16-channel addition is identical to a 2-channel addition, breaking the linear power-scaling law of semiconductor compute.

---

## [UNDER DEVELOPMENT] 5. Planned Validation: The Linearity Proof
**Status:** *Pending Hardware Integration*

To move from theoretical density to empirical proof, the Gatling V1 will undergo a **Photonic Linearity Test**. 

* **The Goal:** Verify that $y = Wx+b$ remains mathematically linear across the full dynamic range of the DMD.
* **The Method:** Using the `linearity_test.py` script, we will incrementally increase the number of active "Flipper" mirrors and measure the resulting ADC voltage.
* **Success Criteria:** A linear correlation ($R^2 > 0.95$) between mirror count (Weight) and sensor output (Result). 

**Next Step:** Integration of the ADS52J90 ADC with the Arty Z7-20 to capture high-speed pulse data.
