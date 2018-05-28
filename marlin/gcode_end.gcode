M104 S0 ;extruder heater off
M140 S0 ;heated bed heater off (if you have it)
G91 ;relative positioning
G1 E-1 F300  ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+0.5 E-5 F9000 ;move Z up a bit and retract filament even more
G90 ;absolute positioning
G1 X200 Y200
M84 ;steppers off
M150 R0 B 0 U255 ;green
;power off
M117 Waiting cooldown
M106 S128         ; Activate blower fan
M109 R40.000000          ;wait fior  temperature to reach 40
;M190 R40.000000
M106 S0           ; shut down blower fan
M117  Shutdown
M81                  ;ShutDown PSU


