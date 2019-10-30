M150 R0 B 0 U255 ;green
M104 S0 ;extruder heater off
M140 S0 ;heated bed heater off
M106 S0       ; shut down blower fan
G91 ;relative positioning
G1 E-1 F300  ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+0.5 E-5 F9000 ;move Z up a bit and retract filament even more
G90 ;absolute positioning
G0 X210 Y210
M84 ;steppers off
G0 Z228 ;move to park position
M84 ;steppers off
M117 Waiting cooldown
M109 R50.000000          ;wait fior  temperature to reach 40
M117  Shutdown
M81;ShutDown PSU
