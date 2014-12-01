include </Users/shawn/SourceCode/3D-Designing/MCAD/regular_shapes.scad>

holder_height=85;

//Vertical support beam
translate([-5,-holder_height/2,0]) cube([10,holder_height*1.2,5]);

//Triangles
difference(){
	linear_extrude(height = 5, center = false, convexity = 10, twist = 0, slices = 20){
		difference()
		{
			triangle(holder_height);
			triangle(holder_height * .66);
		}
	}
	translate([-7.5,holder_height-8,0]) cube([15,10,8]);
}

//Spool holder on top
translate([0,-2,0])
difference(){
	translate([-7.5,holder_height-8,0]) cube([15,10,5]);
	translate([0,holder_height+1,-2]) cylinder(10,9.525/2,9.525/2,0);
}