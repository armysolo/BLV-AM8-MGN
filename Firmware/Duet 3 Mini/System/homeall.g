; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool on Tue Oct 09 2018 13:27:56 GMT+0300
G91                     ; relative positioning
G1 H2 Z5 F6000          ; lift Z relative to current position
G1 H1 X-355 Y-355 F6000  ; move quickly to X or Y endstop and stop there (first pass)
G1 H1 X-355             ; home X axis
G1 H1 Y-355              ; home Y axis
G1 X5 Y5 F6000         ; go back a few mm
G1 H1 X-355 F360        ; move slowly to X axis endstop once more (second pass)
G1 H1 Y-355              ; then move slowly to Y axis endstop
G90                     ; absolute positioning
G1 X194 Y138 F6000 	; go to first bed probe point and home Z
G30                     ; home Z by probing the bed