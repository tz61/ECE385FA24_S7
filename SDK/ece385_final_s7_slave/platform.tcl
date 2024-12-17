# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/ztn/Embedded/ECE385Final_S7_Slave/SDK/ece385_final_s7_slave/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/ztn/Embedded/ECE385Final_S7_Slave/SDK/ece385_final_s7_slave/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {ece385_final_s7_slave}\
-hw {/home/ztn/Embedded/ECE385Final_S7_Slave/ece385final_s7_slave.xsa}\
-proc {microblaze_0} -os {standalone} -out {/home/ztn/Embedded/ECE385Final_S7_Slave/SDK}

platform write
platform generate -domains 
platform active {ece385_final_s7_slave}
platform generate
platform config -updatehw {/home/ztn/Embedded/ECE385Final_S7_Slave/ece385final_s7_slave.xsa}
platform generate -domains 
platform config -updatehw {/home/ztn/Embedded/ECE385Final_S7_Slave/ece385final_s7_slave.xsa}
platform generate -domains 
platform active {ece385_final_s7_slave}
platform config -updatehw {/home/ztn/Embedded/ECE385Final_S7_Slave/ece385final_s7_slave.xsa}
platform generate -domains 
