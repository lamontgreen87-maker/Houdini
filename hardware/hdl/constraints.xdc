## Gatling V1: 4x4 Sensor Grid Pin Mapping
## Target Board: Arty Z7-20
## Connection: Pmod Headers JA and JB (3.3V Logic)

# --- ADC Channel 0-7 (Pmod Header JA) ---
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[0] }]; # Pin 1
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[1] }]; # Pin 2
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[2] }]; # Pin 3
set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[3] }]; # Pin 4
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[4] }]; # Pin 7
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[5] }]; # Pin 8
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[6] }]; # Pin 9
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[7] }]; # Pin 10

# --- ADC Channel 8-15 (Pmod Header JB) ---
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[8] }]; # Pin 1     
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[9] }]; # Pin 2
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[10]}]; # Pin 3
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[11]}]; # Pin 4
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[12]}]; # Pin 7
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[13]}]; # Pin 8
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[14]}]; # Pin 9
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { adc_data_in[15]}]; # Pin 10

# --- Clock & Sync (Using the High-Speed onboard 125MHz differential clock) ---
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];
