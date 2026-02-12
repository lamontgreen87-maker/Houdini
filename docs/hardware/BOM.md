# Bill of Materials (BOM): Gatling V1 Phase 1

This document tracks the core components required for the Phase 1 "First Light" prototype. The Gatling V1 uses professional-grade, off-the-shelf hardware to prove high-density optical compute at a 60W power envelope.

## 1. Core Computational Stack

| System | Component | Part Number | Function |
| :--- | :--- | :--- | :--- |
| **Processor** | **DMD Chip** | [DLP3010FQK](http://googleusercontent.com/shopping_content/0_link) | 0.9M micromirrors acting as binary weights ($W$). |
| **Driver** | **LightCrafter LC** | [DLP3010EVM-LC](http://googleusercontent.com/shopping_content/1_link) | High-speed trigger & pattern control (DLPC3478). |
| **Brain** | **FPGA SoC** | Arty Z7-20 | System orchestration, AXI-Lite bus, and Python interface. |
| **Retina** | **16-Ch ADC EVM** | ADS52J90EVM | Translates 16 parallel light streams to 100MHz digital data. |

## 2. Optical & Sensing Chain

| System | Component | Part Number | Function |
| :--- | :--- | :--- | :--- |
| **Source** | **NIR Laser** | Ushio PL13/15 DFB | 1550nm "Input Vector" ($x$) coherent light source. |
| **Detectors**| **InGaAs Diode** | Marktech MTC1550C | Nanosecond-response sensors optimized for 1550nm. |
| **Optics** | **Convex Lens** | 75mm Bi-Convex | Passive summation (Addition) via photonic convergence. |
| **Viewer** | **IR Card** | Thorlabs VRC2 | Visual alignment of the invisible 1550nm NIR beam. |

## 3. Structural & Alignment

* **Optical Rails:** Thorlabs RLA Series (Aluminum Construction).
* **Mounting:** 16mm Cage System for sensor-grid alignment.
* **Filtering:** 1550nm Bandpass Filter (OD4) to eliminate ambient room noise.

---

### Implementation Notes:
* **The "Light Control" Requirement:** We use the `DLP3010EVM-LC` specifically because the `DLPC3478` controller allows for raw 1-bit pattern streaming, bypassing the video processing artifacts found in standard projectors.
* **The "Retina" Sync:** The `ADS52J90EVM` is clocked via the FPGA to ensure the ADC samples are perfectly synchronized with the DMD mirror flips.
