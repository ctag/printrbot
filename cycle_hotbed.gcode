; Cycle Hotbed
; Custom G-code to unadhere parts
; from build surface via thermal
; expansion.
; By: Christopher Bero [bigbero@gmail.com]

M140 S70.000000 ; Set hotbed to 80C, should only ever reach ~65C

; Wait for 8 minutes
G4 P120000 ; two minutes
G4 P120000 ; two minutes
G4 P120000 ; two minutes
G4 P120000 ; two minutes


M140 S0.000000 ; Turn off hotbed
