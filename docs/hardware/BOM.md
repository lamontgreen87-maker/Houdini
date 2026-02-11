# Gatling V1: Master Bill of Materials (BOM)

This document lists the critical components required to assemble the Gatling V1 Photonic Accelerator. All parts are selected for high-speed NIR (1310nm/1550nm) compatibility and Zynq-7000 SoC integration.

| Category | Component | Purpose | Vendor Link |
| :--- | :--- | :--- | :--- |
| **Light Power** | Ushio 1310/1550nm Combiner | Dual-wavelength NIR "Power Supply" | [Ushio NIR](https://www.ushio.com/product/laser-diodes/) |
| **Driver** | Thorlabs CLD1010LP | Current & TEC Thermal Control | [Thorlabs CLD1010LP](https://www.thorlabs.com/thorproduct.cfm?partnumber=CLD1010LP) |
| **Collimator** | Thorlabs PAF2-A15C | Achromatic FiberPort Alignment | [Thorlabs PAF2-A15C](https://www.thorlabs.com/thorproduct.cfm?partnumber=PAF2-A15C) |
| **The ALU** | DLP3010EVM-LC | 32kHz Photonic Weight Modulation | [TI DLP3010EVM](https://www.ti.com/tool/DLP3010EVM-LC) |
| **The Adder** | 75mm NIR PCX Lens | Optical Summation (GEMM Core) | [Thorlabs NIR Optics](https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=112) |
| **The Retina** | Hamamatsu G11097-0606S | 6x6 InGaAs Detector Array (Use 4x4) | [Hamamatsu InGaAs](https://www.hamamatsu.com/us/en/product/optical-sensors/image-sensor/ingaas-image-sensor/ingaas-area-image-sensor/G11097-0606S.html) |
| **Pre-Amp** | TI OPA855 | High-speed TIA (Light-to-Voltage) | [TI OPA855](https://www.ti.com/product/OPA855) |
| **Bridge** | ADS52J90 EVM | 19.2 Gbps ADC-to-FPGA Interface | [TI ADS52J90EVM](https://www.ti.com/tool/ADS52J90EVM) |
| **The Brain** | Arty Z7-20 SoC FPGA | Zynq-7000 Memory Controller | [Digilent Arty Z7](https://digilent.com/reference/programmable-logic/arty-z7/start) |
| **Safety** | Honeywell XC Glasses | OD 5+ NIR Protection (1310-1550nm) | [Honeywell Safety](https://sps.honeywell.com/us/en/products/safety/personal-protective-equipment/eye-and-face-protection/laser-safety-eyewear) |
