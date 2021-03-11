M80 ; poweron
M501 ; restope EEPROM workaarount for TMC
G21 ;metric values
G90 ;absolute positioning
G28 ;home
M118 //action:afterHome
M118 //action:nozzleClean
G91 ;relative
G0 Z1 F10
