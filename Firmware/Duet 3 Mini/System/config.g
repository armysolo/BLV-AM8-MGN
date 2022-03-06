; Configuration file for Duet 3 Mini (firmware version 3)
; executed by the firmware on start-up
;
; Created by David Husolo November 15 2021

; General preferences
G90															; send absolute coordinates...
M83															; ...but relative extruder moves
M669 K0														; Select Cartesian mode

; Drives
M569 P0.0 S0												; physical drive 0 goes forwards
M569 P0.1 S1												; physical drive 1 goes backwards
M569 P0.2 S0												; physical drive 2 goes forwards
M569 P0.3 S1												; physical drive 3 goes backwards
M569 P0.4 S1												; physical drive 3 goes forwards
M584 X0.1 Y0.2 Z0.3:0.4 E0.0								; set drive mapping
M350 X32 Y32 I0												; configure microstepping without interpolation
M350 Z16 E16 I1												; configure microstepping with interpolation
M92 X160.00 Y160.00 Z400.00 E415.15							; set steps per mm
M566 X800.00 Y800.00 Z240.00 E2000.00						; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z1000.00 E12000.00					; set maximum speeds (mm/min)
M201 X1500.00 Y1500.00 Z120.00 E4000.00						; set accelerations (mm/s^2)
M906 X1600 Y1600 Z1500 E1600 I30							; set motor currents (mA) and motor idle factor in per cent
M84 S120													; Set idle timeout

; Axis Limits
M208 X-8 Y-18 Z0 S1											; set axis minima
M208 X297 Y280 Z216 S0										; set axis maxima

; Endstops
M574 X1 S1 P"0.io2.in"										; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"0.io3.in"										; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2													; configure Z-probe endstop for low end on Z
M591 D0 P1 C"0.io5.in" S1									; configure filament runout sensor for high end on extruder drive 0 via pin i03.in

; Z-Probe
M950 S0 C"0.io1.out"										; create servo pin 0 for BLTouch
M558 P9 C"^0.io1.in" H5 F200 T9000							; set Z probe type to bltouch and the dive height + speeds
G31 P100 X0 Y0 Z2.023										; set Z probe trigger value, offset and trigger height

; Heaters
M308 S0 P"0.temp0" Y"thermistor" A"Bed" T100000 B3950 C0.06e-8 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"0.out0" T0										; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 R0.301 C811.5 D31.63 S1.00						; Heatbed PID
M140 H0														; map heated bed to heater 0
M143 H0 S120												; set temperature limit for heater 0 to 120C
M308 S1 P"0.temp1" Y"thermistor" A"Hotend" T100000 B3950 C0.06e-8  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"0.out1" T1										; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 R2.378 C138.1 D8.08 S1.00 V23.9					; Hotend PID .4mm
M143 H1 S260
M308 S2 P"mcu-temp" Y"mcu-temp" A"Duet Board"				; Configure MCU sensor

; Fans
M950 F0 C"0.out3" Q500										; create fan 0 on pin fan0 and set its frequency
M106 P0 C"LY Fan1" S0 H-1									; set fan 0 value. Thermostatic control is turned on
M950 F1 C"0.out4" Q500										; create fan 0 on pin fan0 and set its frequency
M106 P1 C"LY Fan2" S0 H-1									; set fan 0 value. Thermostatic control is turned on
M950 F2 C"0.out5" Q500										; create fan 0 on pin fan0 and set its frequency
M106 P2 C"HE Fan" S1 H1 T40									; set fan 0 value. Thermostatic control is turned on
M950 F3 C"0.out6" Q500										; create fan 1 on pin fan1 and set its frequency
M106 P3 C"MB Fan" T40 H2									; set fan 0 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0:1											; define tool 0
G10 P0 X0 Y0 Z0												; set tool 0 axis offsets
G10 P0 R0 S0												; set initial tool 0 active and standby temperatures to 0C

; Custom settings
M564 H0														; Let the Jog buttons work blv: added to allow jog buttons

; Shutdown button
M950 J1 C"!0.io6.in"										; Create GPIO pin for On button wired NO-must be inverted with !
M581 T2 P1 S1 R0											; T2-Run Trigger 2; P1-J1; S1-When button pressed; R0-trigger any time

; Miscellaneous
M575 P1 S1 B57600											; enable support for PanelDue
;M918 P2 E4 R6 ; configure direct-connect display