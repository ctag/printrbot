use <servo_arm.scad>

arm_length = 80;

arm_count = 1; // [1,2,3,4,5,6,7,8]

//  Clear between arm head and servo head (PLA: 0.3, ABS 0.2)
SERVO_HEAD_CLEAR = 0.24; // [0.2,0.3,0.4,0.5]

$fn = 40 / 1;

module holes() {
    translate([0,60,-2]) {
        cylinder(h=20,d=3.2,center=false);
        translate([0,15,0]) {
            cylinder(h=20,d=3.2,center=false);
        }
    }
}

module modified_arm() {
    translate([0,0,6]) {
        demo();
    }
}

module arm_w_holes() {
    difference() {
    modified_arm();
    holes();
    }
}

module bar() {
    module bar_item() {
        translate([-5,55,0.5]) {
            translate([0,0,0]) {
                cube([10, 25, 4]);
            }
            translate([0,25,0]) {
                cube([10,3,80]);
            }
        }
    }
    
    difference() {
        bar_item();
        holes();
        scale([1.25,1.0,1.1]) {
            modified_arm();
        }
    }
}

arm_w_holes();
rotate([-90,0,0]) {
rotate([0,0,90]) {
    translate([-5,-100,0]) {
        bar();
    }
}
}





















