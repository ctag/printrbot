// main
// Copyright (C) Henrik Björkman www.eit.se/hb
// Created by Henrik Björkman 2013-05-15
// Gnu public license v3

include<henriks_generic_modules.scad>
//include<parameters.scad>
//include<modules.scad>


// x = forward
// y = left
// z = up


// For H0 scale (1:87) use  1000/87 here (or use other desired scale):
//x=1000/87; // H0 scale
x=1000/(160); // N scale

// Example of measurements in meters of a tiger I tank
// Numbers here are in meters.
length_with_gun=9.670*x;
length=7.69*x;
width_with_tracks=3.75*x; 
height_to_cupola=2.99*x;
height_to_hull=height_to_cupola*2/3;



// We can't print thinner than 1 mm so this may need to be adjusted 
// in small scales
//cannon_outer_diam=2*0.088*x; // Just a guess, inner diam was 88 mm
cannon_outer_diam=3.5*0.088*x;


wheel_diam=height_to_hull*0.5; // actual wheel dialmeter was 0.80 m
lower_wheel_1_x=length*0.33;
lower_wheel_2_x=length*0.22;
lower_wheel_3_x=length*0.11;
lower_wheel_4_x=length*0.00;
lower_wheel_5_x=-length*0.11;
lower_wheel_6_x=-length*0.22;
lower_wheel_7_x=-length*0.33;
upper_front_wheel_x=length*0.86/2;
upper_rear_wheel_x=-length*0.87/2;






// Radius is half the distance between two oposite edges 
module h_kil(base,height,z)
{
  //translate([0, 0, -20])
  linear_extrude(height = z, center = true, convexity = 10)
  polygon([[0,base/2], [0,-base/2], [height,0]], convexity = N);
}



module tracks_outer(factor)
{
  hull()
  {
     all_wheels(factor);
  }
}


module all_wheels(factor)
{
     // upper front wheel
     translate([upper_front_wheel_x, 0, 0.40*height_to_hull])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     // upper rear wheel
     translate([upper_rear_wheel_x, 0, 0.35*height_to_hull])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor*0.9/2,width_with_tracks*0.175);

     // lower wheels
     translate([lower_wheel_1_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     translate([lower_wheel_2_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     translate([lower_wheel_3_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     translate([lower_wheel_4_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     translate([lower_wheel_5_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     translate([lower_wheel_6_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);

     translate([lower_wheel_7_x, 0, wheel_diam*0.95/2])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);
  
}


module tracks()
{
      translate([0,width_with_tracks*0.0,0.5*height_to_hull])
    cube([length*0.96,width_with_tracks*0.2,0.3*height_to_hull], center=true);


   difference()
   {
      tracks_outer(1);
      translate([0,width_with_tracks*0.10,0])
      tracks_outer(0.7);
   }

   all_wheels(0.80);

}


module body()
{

  translate([length*0.32, 0, 0.6*height_to_hull])
  rotate([90,0,0])
  h_kil(height_to_hull*0.5,length*0.15,width_with_tracks*0.60 );

  translate([-length*0.08, 0, 0.6*height_to_hull])
  cube([length*0.8,width_with_tracks*0.60,0.5*height_to_hull], center=true);


/*
  // Drivers viewing hatch
  translate([-length*0.15/2 + length*0.85/2, width_with_tracks*0.15, 0.75*height_to_hull])
  cube([length*0.02,width_with_tracks*0.18,height_to_hull*0.1], center=true);
*/

/*
  // front machine gun
  translate([-length*0.15/2 + length*0.85/2, -width_with_tracks*0.15, 0.75*height_to_hull])
  sphere(width_with_tracks*0.035,$fs=0.5);
*/

  // engine hood or whatever, needed to put something there
  translate([-length*0.4, 0, 0.84*height_to_hull])
  cube([length*0.1,length*0.2,height_to_hull*0.1], center=true);

  // mount for turret
  translate([0, 0, 0.84*height_to_hull])
  h_cylinder(width_with_tracks*0.25,height_to_hull*0.1);


  // Added to make printing easier. We print it standing on the rear so it need to be flat here.
  translate([-length*0.49, 0, 0.6*height_to_hull])
  cube([length*0.013,length*0.2,height_to_hull*0.4], center=true);


}

module turret()
{
  /*
  // front part of turret
  translate([length*0.225, 0, 1.1*height_to_hull])
  rotate([90,0,0])
  h_kil(height_to_hull*0.4,length*0.10,width_with_tracks*0.70 );


  // middle part of turret
  translate([0, 0, height_to_hull*1.1])
  //sphere(8, $fa=5, $fs=0.1); 
  cube([length*0.45,width_with_tracks*0.70,height_to_hull*0.4], center=true);
  */

  hull()
  {
    translate([length*0.32, 0, 1.1*height_to_hull])
    sphere(width_with_tracks*0.0001);

    translate([length*(0.45/2+0.05), 0, 1.3*height_to_hull])
    sphere(width_with_tracks*0.0001);

    translate([length*(0.45/2+0.05), 0, 0.9*height_to_hull])
    sphere(width_with_tracks*0.0001);

    translate([length*0.27, width_with_tracks*0.35 , 1.1*height_to_hull])
    sphere(width_with_tracks*0.0001);

    translate([length*0.27, -width_with_tracks*0.35 , 1.1*height_to_hull])
    sphere(width_with_tracks*0.0001);

    // middle part of turret
    translate([0, 0, height_to_hull*1.1])
    //sphere(8, $fa=5, $fs=0.1); 
    cube([length*0.45,width_with_tracks*0.70,height_to_hull*0.4], center=true);

    // rear part of turret
    translate([-0.16*length, 0, height_to_hull*1.2])
    //sphere(8, $fa=5, $fs=0.1); 
    cube([length*0.36,width_with_tracks*0.70,height_to_hull*0.3], center=true);
  }




  //translate([0, 0, height_to_hull*1.1])
  //h_cylinder(width_with_tracks*0.75/2,height_to_hull*0.4);

  // hatch
  translate([-length*0.1, 0.13*width_with_tracks, height_to_hull*1.25])
  h_cylinder(0.10*width_with_tracks,height_to_hull*0.25);

  cannon();

}


module cannon()
{
  // cannon
  translate([15/40*length, 0, height_to_hull*1.1])
  rotate([90,0,90])
  {
    h_cylinder(cannon_outer_diam/2,length_with_gun*0.5);

    translate([0, 0, -length_with_gun*0.15])
    h_cylinder(1.8*cannon_outer_diam/2,length_with_gun*0.3);

    translate([0, 0, -length_with_gun*0.10])
    h_cylinder(1.4*cannon_outer_diam/2,length_with_gun*0.3);
    
    translate([0, 0, length_with_gun*0.15])
    h_cylinder(1.4*cannon_outer_diam/2,length_with_gun*0.05);
  }
}

module body_and_tracks()
{
  body();

  // right tracks
  mirror([0,1,0])
  translate([0, width_with_tracks*0.4, 0])
  tracks();

  // left tracks
  translate([0, width_with_tracks*0.4, 0])
  tracks();

  // axle to mount turret on
  translate([0, 0, height_to_hull])
  rotate([0,0,90])
  h_cylinder(2,4);

}

module turret_with_mounting_hole()
{
  //translate([0, 0, 0.2])
  difference() 
  {
    turret();

    // hole for axle for turret
    translate([0, 0, height_to_hull])
    rotate([0,0,90])
    h_cylinder(2.1,4*1.2);
  }


}

module rotated_body_flat_rear()
{
  difference() 
  {
    translate([0, 0, length*0.492])
    rotate([0,-90,0])
    body_and_tracks();

    h_mask_lower_z();
  }
}


module rotated_turret_flat_rear()
{
  difference() 
  {
    translate([0, 0, length*0.33])
    rotate([0,-90,0])
    turret_with_mounting_hole();

    h_mask_lower_z();
  }
}


module full_modell()
{
  body_and_tracks();
  turret_with_mounting_hole();
}




// model needs to be printed in 2 pieces,
// preferably in a vertical position, that is standing on its back


// uncomment one of these when exporting to stl:

full_modell();
//rotated_body_flat_rear();
//rotated_turret_flat_rear();


