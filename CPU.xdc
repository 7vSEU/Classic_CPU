## This file is a general .xdc for the Nexys4 DDR Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports CLK]
create_clock -period 10000000.000 -name sys_clk_pin -waveform {0.000 5000000.000} -add [get_ports CLK]

##Buttons
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports RESET]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property PACKAGE_PIN H17 [get_ports LED]
set_property IOSTANDARD LVCMOS33 [get_ports LED]
