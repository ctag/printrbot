// I have no idea what I'm doing.

fan_height=3; // Height of plate
fan_width=44; // width of plate
fan_length=50; // length of plate
main_circ_d=38; // Diameter of fan hole
alt_circ_d=5; // Diameter of bolt hole

arm_width=20;
arm_depth=3;
arm_height=80;

module fan() {
    fan_offset=(fan_width-main_circ_d)/2; // Half the size of main circle
    alt_circ_dist=(main_circ_d-alt_circ_d); // Distance between alt circles
    function alt_fan_offset(x) = (x*(alt_circ_dist-3));
    
    difference() {
        // Fan plate
        cube(size=[fan_length,fan_width,fan_height], center=false);
        
        translate([(fan_width/2)+(fan_length-fan_width),(fan_width/2),0]) { 
            // Main Circle
            cylinder(h=fan_height, d=main_circ_d, center=false);
            translate([(-alt_circ_dist/2)+1.5,(-alt_circ_dist/2),0]) {
                // Generate four alt circles
                for (a=[0:1]) {
                    translate([alt_fan_offset(a),0,0]) {
                        cylinder(h=fan_height, d=alt_circ_d, center=false);
                    }
                    translate([alt_fan_offset(a),alt_circ_dist,0]) {
                        cylinder(h=fan_height, d=alt_circ_d, center=false);
                    }
                }
            }
        }
    }
}

module arm() {
    difference() {
        translate([0,(fan_width-arm_width)/2,0]) {
            cube(size=[arm_depth,arm_width,arm_height], center=false);
            //cube(size=[arm_depth+3,arm_width,fan_height+3], center=false);
        }
        chisel_arm();
        place_mnt_pts();
    }
}

module chisel_arm() {
    translate([0,0,25]) {
        rotate([60,0,0]) {
            cube([arm_depth,80,50]);
        }
    }
//    translate([0,44,25]) {
//        rotate([20,0,0]) {
//            cube([arm_depth,50,80]);
//        }
//    }
    translate([0,(fan_width-arm_width)/2,75]) {
        cube([arm_depth,arm_width,10]);
    }
}

module mnt_pts() {
    translate([0,0,-0.2]) {
        cylinder(h=arm_depth+0.4,d=4,center=false);
        translate([20,0,0]) {
            cylinder(h=arm_depth+0.4,d=4,center=false);
        }
    }
}

module place_mnt_pts() {
    translate([-0.1,28,66]) {
    rotate([-30,0,0]) {
    rotate([0,90,0]) {    
            mnt_pts();
        }
    }
}
}

module fan_mount() {
    union() {
        fan();
        //arm();
    }
}

probe_width=30;

module probe_mount() {
    module base() {
        union() {
            cube(size=[probe_width+5,probe_width,fan_height], center=false);
            cube(size=[arm_depth, probe_width, 15], center=false);
        }
    }
    module drill_holes() {
        difference() {
            base();
            translate([0,(probe_width-20)/2,10]) {
                rotate([0,90,0]) {
                    rotate([0,0,90]) {
                        mnt_pts();
                    }
                }
            }
        }
    }
    module place_main_hole() {
        diff=(probe_width-20)/2;
        difference() {
            drill_holes();
            translate([(10+diff)+5,(10+diff),-0.1]) {
                cylinder(h=fan_height+0.2,d=20,center=false);
            }
        }
    }
    place_main_hole();
}


//probe_mount();
fan_mount();






