; perimeters extrusion width = 0.40mm
; infill extrusion width = 0.42mm
; solid infill extrusion width = 0.42mm
; top infill extrusion width = 0.42mm

G21 ; set units to millimeters
M107 ; fan off
G28 X ; home all axes
G28 Y ; 
G28 Z ;
G90 ; absolute coords
G1 X10 Y150 Z1 F2400 ; lift nozzle

G1 Y0 ;
G1 Z5 X1 ;
G1 Y150 ; 
G1 Z1 ;
G1 X20 ; 

G1 Y0 ;
G1 Z5 X10 ;
G1 Y150 ; 
G1 Z1 ;
G1 X30 ; 

G1 Y0 ;
G1 Z5 X20 ;
G1 Y150 ; 
G1 Z1 ;
G1 X40 ; 

G1 Y0 ;
G1 Z5 X30 ;
G1 Y150 ; 
G1 Z1 ;
G1 X50 ; 

G1 Y0 ;
G1 Z5 X40 ;
G1 Y150 ; 
G1 Z1 ;
G1 X60 ; 

G1 Y0 ;
G1 Z5 X50 ;
G1 Y150 ; 
G1 Z1 ;
G1 X70 ; 

G1 Y0 ;
G1 Z5 X60 ;
G1 Y150 ; 
G1 Z1 ;
G1 X80 ; 

G1 Y0 ;
G1 Z5 X70 ;
G1 Y150 ; 
G1 Z1 ;
G1 X90 ; 

G1 Y0 ;
G1 Z5 X80 ;
G1 Y150 ; 
G1 Z1 ;
G1 X100 ; 

G1 Y0 ;
G1 Z5 X90 ;
G1 Y150 ; 
G1 Z1 ;
G1 X110 ; 

G1 Y0 ;
G1 Z5 X100 ;
G1 Y150 ; 
G1 Z1 ;
G1 X120 ; 

G1 Y0 ;
G1 Z5 X110 ;
G1 Y150 ; 
G1 Z1 ;
G1 X130 ; 

G1 Y0 ;
G1 Z5 X120 ;
G1 Y150 ; 
G1 Z1 ;
G1 X140 ; 

G1 Y0 ;
G1 Z5 X130 ;
G1 Y150 ; 
G1 Z1 ;
G1 X149 ; 

G1 Y149;
G1 X1;

M84 ; disable motors
