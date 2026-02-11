# Gatling V1 Power Budget & Efficiency Analysis

| Component             | Part Number          | Est. Power (W) | Function                          |
|:----------------------|:---------------------|:---------------|:----------------------------------|
| **Photon Source** | 1550nm Laser Diode   | 3.0 - 5.0      | Continuous Wave (CW) Input (x)    |
| **Spatial Modulator** | DLP3010 DMD + Driver | 8.0 - 12.0     | Weight Matrix Logic (W)           |
| **The Brain** | ZedBoard (Zynq-7000) | 15.0 - 25.0    | Data Orchestration & DMA          |
| **Quantization** | ADS52J90 EVM         | 2.5 - 4.0      | Multi-channel ADC (y)             |
| **Signal Chain** | Hamamatsu InGaAs + TIA| 1.0 - 2.0      | Photo-electric Conversion         |
| **TOTAL** |                      | **29.5 - 48W** | **Target: < 60 Watts** |

---

## The "Passive Math" Advantage
Unlike a CMOS-based GPU, the power consumption of the Gatling V1 does not scale linearly with the complexity of the matrix. 

* **Multiplication ($W \times x$):** Handled via reflection/absorption. Energy cost = 0W.
* **Addition ($\sum$):** Handled via spatial superposition (lens). Energy cost = 0W.
* **Bias ($+b$):** Handled via static mirror offsets. Energy cost = 0W.

**Conclusion:** We are essentially "paying" for the data movement (FPGA) and the light source, while getting the "Matrix Math" for free.
