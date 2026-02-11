# Gatling V1: Photonic Tensor Accelerator
**A Hybrid SoC-Photonic Inference Engine for 4D Tensor Contraction**

[![Project Status: Research](https://img.shields.io/badge/Status-Research--Design-blueviolet)](https://github.com/your-username/gatling-v1)
[![Hardware: Arty Z7-20](https://img.shields.io/badge/Hardware-Arty--Z7--20-orange)](https://digilent.com/reference/programmable-logic/arty-z7/start)
[![Architecture: Zynq-7000](https://img.shields.io/badge/Architecture-Zynq--7000-red)](https://www.xilinx.com/products/silicon-devices/soc/zynq-7000.html)

Gatling V1 is a **high-integrity photonic co-processor** designed to offload General Matrix Multiply-Accumulate (GEMM) operations to a passive optical core. By leveraging **Diffractive Dithering** and a dual-wavelength NIR column, it performs tensor contractions at the speed of light with a deterministic **19.2 Gbps throughput**.

---

## 🚀 Key Specifications
* **Optical ALU:** DLP3010 DMD with 32kHz refresh rate.
* **Instruction Bus:** Dual-wavelength 1310nm/1550nm Achromatic Column.
* **Data Bridge:** 16-channel [ADS52J90 100MSPS ADC](https://www.ti.com/product/ADS52J90).
* **SoC Interface:** Zynq-7020 via Dual AXI_HP ports (1.2 GB/s each).
* **OS Support:** PetaLinux (Zynq-7000 ARM Cortex-A9).

---

## 🧠 Memory Mapping (Zero-Copy Architecture)
The 512MB DDR3 RAM is strictly segmented to isolate the high-speed math flood from the Linux kernel.

| Physical Address Range | Logical Zone      | Description                                  |
| :--------------------- | :---------------- | :------------------------------------------- |
| `0x0000_0000` - `0x01FF_FFFF` | **OS Reserved** | PetaLinux Kernel / RootFS / Legacy Tasks.    |
| `0x0200_0000` - `0x1FFF_FFFF` | **Math Buffer** | **DMA Injection Zone.** 4x4 Tensor results.  |
| `0x2000_0000` - `0x3FFF_FFFF` | **User Space** | Application Logic and Python Pattern Gen.    |
| `0x43C0_0000`          | **Control Regs** | AXI-Lite registers for Laser/DMD/ADC Sync.   |

---

## 🛠 Project Structure
* `/docs`: Detailed [Whitepaper](docs/whitepaper.md) and Technical Manifesto.
* `/hdl`: Verilog/VHDL source for AXI_HP DMA and LVDS ADC interfacing.
* `/sw`: Python scripts for generating **Diffractive Dithering** patterns.
* `/hardware`: XDC constraints and 30mm Cage System assembly diagrams.

---

## ⚠️ Safety Warning
This project utilizes **Invisible Class 3B Near-Infrared (NIR) Lasers** (1310nm/1550nm). 
* **OD 5+ Laser Safety Eyewear** is mandatory for all alignment procedures.
* Never view the "Instruction Column" directly; use IR viewing cards only.

---

## 📜 Acknowledgements
* Built for high-performance physics simulation and real-time AI inference.
* Special thanks to the **r/FPGA** community for the architecture red-teaming.

---
