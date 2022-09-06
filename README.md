# BLV-AM8-MGN  
# Notice for stepper wiring #  

* Don't trust the data sheet or other schematics to be correct. You should test the wires yourself to find the coil pairs. Do not connect/disconnect the stepper motors while the board has power. You can blow stepper drivers. With the motor wires NOT connected to anything:  
The idea is to find the two cables that form one of the two coils inside the stepper. If you short two wires together and the stepper shaft is hard to turn by hand you found one pair of wires for a coil.  
Example- If black and green wires are a pair call them coil 1, than red and blue can be coil 2.  
* Duet labels the Duet 2 Wifi stepper ports with 2B 2A(red-blue) and 1A 1B(green-black).  
* Duet 3 is labeled B1 B2(black-green) and A1 A2(red-blue).
 
# Rail Relocation Mod #  

* This mod is designed to move the linear rails from the front of the 2040 extrusions to the outside. Having the linear rails on the side makes installing the X 2020 considerably easier. Make sure you line up the linear rails with the 2020 jig from the original download.  

* The original X 2020 was 420mm. This modification will require a 450mm 2020 for the X. You can go longer but the new 2020 needs to be at least 30mm longer. There's 7 parts you'll need to print. View the pictures, the replacement parts are in green. You should be able to reuse the original parts. You'll also need a longer belt.  

# AM8 MGN CoreXY X Carriage #  
* I've modified the X carriage from the CoreXY to work with the AM8 MGN mod. You'll need to print the 7 parts from my mod that moves the linear rails to the outsides of 2040 and all 9 parts for the X carriage. This mod also moves the X endstop from the top of the 2020 to be recessed on the inside of the X Carriage Rear plate. It might not be necessary so you make the choice.  
 
# AM8 MGN CoreXY X Carriage #  
My modified Y belt setup. I didn't start with an original Anet instead I built everything custom from the ground up.  

## BOM ##  
* 2040 Y Motor  
** 2x M5x8mm button head screws  
** 2x M5 T-Nuts  
** 4x M3x8mm socket head screws  

* Y Adjustable Belt Holder  
** 4x M4x12 socket head screws  
** 4x M4 nuts  
** 3x M3 nuts  
** 1x M3x35mm socket head screw  
** 2x M3x6mm button head screws

* Y Tensioner  
** 4x M5x8mm button head screws  
** 4x M5 T-Nuts  
** 1x M3x20mm socket head screw  
** 3x M3 washers
** 2x F6232ZZ bearings
