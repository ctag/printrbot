module wrench_org_in_longs(){
	difference()
	{
		cube([107,10,23]);
		
		translate([10,-1,4]) rotate([0,-15,0]) cube([6.5,12,20]);
		translate([22,-1,4]) rotate([0,-15,0]) cube([6.2,12,20]);
		translate([34,-1,4]) rotate([0,-15,0]) cube([5.2,12,20]);
		translate([46,-1,4]) rotate([0,-15,0]) cube([5.2,12,20]);
		translate([58,-1,4]) rotate([0,-15,0]) cube([5.1,12,20]);
		translate([68,-1,4]) rotate([0,-15,0]) cube([4.2,12,20]);
		translate([78,-1,4]) rotate([0,-15,0]) cube([3.2,12,20]);
		translate([88,-1,4]) rotate([0,-15,0]) cube([2.95,12,20]);
		translate([98,-1,4]) rotate([0,-15,0]) cube([2.75,12,20]);
		
		translate([2,-1,-10]) rotate([0,-15,0]) cube([5,12,50]);
		translate([110,-1,-10]) rotate([0,-15,0]) cube([7,12,50]);
	}
}

module wrench_org_in_shorts(){
	difference()
	{
		cube([88,10,23]);
		
		translate([10,-1,4]) rotate([0,-15,0]) cube([6.6,12,20]);
		translate([22,-1,4]) rotate([0,-15,0]) cube([5.1,12,20]);
		translate([34,-1,4]) rotate([0,-15,0]) cube([5.1,12,20]);
		translate([46,-1,4]) rotate([0,-15,0]) cube([5.4,12,20]);
		translate([58,-1,4]) rotate([0,-15,0]) cube([4.3,12,20]);
		translate([68,-1,4]) rotate([0,-15,0]) cube([3.8,12,20]);
		translate([78,-1,4]) rotate([0,-15,0]) cube([3,12,20]);


		translate([2,-1,-10]) rotate([0,-15,0]) cube([5,12,50]);
		translate([90,-1,-10]) rotate([0,-15,0]) cube([7,12,50]);
	}
}

module wrench_org_mm_longs(){
	difference()
	{
		cube([120,10,23]);
		
		translate([10,-1,4]) rotate([0,-15,0]) cube([5.4,12,20]);
		translate([22,-1,4]) rotate([0,-15,0]) cube([5.8,12,20]);
		translate([34,-1,4]) rotate([0,-15,0]) cube([4.7,12,20]);
		translate([46,-1,4]) rotate([0,-15,0]) cube([4.6,12,20]);
		translate([58,-1,4]) rotate([0,-15,0]) cube([3.75,12,20]);
		translate([68,-1,4]) rotate([0,-15,0]) cube([3.5,12,20]);
		translate([78,-1,4]) rotate([0,-15,0]) cube([3.3,12,20]);
		translate([88,-1,4]) rotate([0,-15,0]) cube([3.25,12,20]);
		translate([98,-1,4]) rotate([0,-15,0]) cube([2.9,12,20]);
		translate([106,-1,4]) rotate([0,-15,0]) cube([2.9,12,20]);
		translate([112,-1,4]) rotate([0,-15,0]) cube([2.8,12,20]);

		translate([2,-1,-10]) rotate([0,-15,0]) cube([5,12,50]);
		translate([122,-1,-10]) rotate([0,-15,0]) cube([7,12,50]);
	}
}

module wrench_org_mm_shorts(){
	difference()
	{
		cube([88,10,23]);
		
		translate([10,-1,4]) rotate([0,-15,0]) cube([5.1,12,20]);
		translate([22,-1,4]) rotate([0,-15,0]) cube([4.5,12,20]);
		translate([34,-1,4]) rotate([0,-15,0]) cube([4.5,12,20]);
		translate([46,-1,4]) rotate([0,-15,0]) cube([4.4,12,20]);
		translate([58,-1,4]) rotate([0,-15,0]) cube([4.25,12,20]);
		translate([68,-1,4]) rotate([0,-15,0]) cube([3.7,12,20]);
		translate([78,-1,4]) rotate([0,-15,0]) cube([3.7,12,20]);


		translate([2,-1,-10]) rotate([0,-15,0]) cube([5,12,50]);
		translate([90,-1,-10]) rotate([0,-15,0]) cube([7,12,50]);
	}
}
//wrench_org_in_shorts();
//translate([64,9,0]) cube([10,20,4]);
//translate([14,9,0]) cube([10,20,4]);
//translate([0,28,0]) wrench_org_in_shorts();

//wrench_org_in_longs();
//translate([84,9,0]) cube([10,40,4]);
//translate([14,9,0]) cube([10,40,4]);
//translate([0,48,0]) wrench_org_in_longs();

//wrench_org_mm_shorts();
//translate([64,9,0]) cube([10,20,4]);
//translate([14,9,0]) cube([10,20,4]);
//translate([0,28,0]) wrench_org_mm_shorts();

wrench_org_mm_longs();
translate([84,9,0]) cube([10,40,4]);
translate([14,9,0]) cube([10,40,4]);
translate([0,48,0]) wrench_org_mm_longs();
