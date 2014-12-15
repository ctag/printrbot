


union() {
difference() {
	cylinder(11, 15, 15, [0, 0, 0]);
	cylinder(12, 12, 12, [0, 0, 0]);
}
translate([0,0,10]) {
	cylinder(2,15,15,[0,0,0]);
}
}

translate([-8, 12, 0]) {
	cube([16,4,20]);
	cube([16,10,4]);
	translate([0, 10, 0]) {
		cube([16,4,15]);
		translate([0,1,12]) {
			rotate([45,0,0]) {
				cube([16,4,9]);
			}
			rotate([-45,0,0]) {
				cube([16,4,9]);
			}
		}
	}
}











