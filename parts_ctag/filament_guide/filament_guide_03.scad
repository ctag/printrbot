/** 
 * Filament guide for a printrbot simple metal
 * To be used on the 12mm z-axis
 * Made by: Christopher Bero
 * [bigbero@gmail.com]
 * https://github.com/ctag/printrbot/tree/master/parts_ctag/filament_guide
 */

// Join resulting pieces
union() {
    // Cap piece
    difference() {
        cylinder(12, 7.5, 7.5, [0, 0, 0]);
        cylinder(11, 6.2, 6.2, [0, 0, -0.2]);
    }
    // inner part of guide
    translate([-13, 7, 0]) {
        cube([26,2,12]); // plate against cap
        cube([26,10,2]); // Bottom plate
        translate([0,0,11.9]) {
            rotate([-45,0,0]) {
                cube([4,2,8]); // inside out flange
            }
        translate([22,0,0]) {
            rotate([-45,0,0]) {
                cube([4,2,8]); // inside out flange
            }
        }
        }
    }
    // outer part of guide
    translate([-4, 15, 0]) {
        cube([8,2,12]); // Vetical outer column
        translate([0,0,11.9]) {
            rotate([45,0,0]) {
                cube([8,2,8]); // innert flange
            }
            rotate([-45,0,0]) {
                cube([8,2,6]); // outter flange / thumb grip
            }
        }
    }
} // end union











