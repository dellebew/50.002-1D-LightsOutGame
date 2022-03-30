set projDir "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/vivado"
set projName "LightsOutGame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/au_top_0.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/initial_board_states_1.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/display_2.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/alu_3.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/edge_detector_4.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/button_conditioner_5.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/reset_conditioner_6.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/state_inverter_7.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/win_checker_8.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/display_encoder_9.v" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/verilog/pipeline_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/User/Documents/50.002/50002_1D/lightsout3/LightsOutGame-main/work/constraint/alchitry.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
