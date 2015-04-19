// main
// Copyright (C) Henrik & Alexander Björkman www.eit.se/hb
// Created by Henrik & Alexander Björkman 2013-05-15
// Gnu public license v3
//
// History
// Used Henriks Tiger as template to create a Sherman


// http://commons.wikimedia.org/wiki/File:Sherman_Tank_WW2.jpg



include<henriks_generic_modules.scad>


// x = forward
// y = left
// z = up


// For H0 scale (1:87) use  1000/87 here (or use other desired scale):
//m=1000/87;
//m=40/6.316;
m=1000/(160); // N scale

// Measurements in meters
// Numbers here are in meters.
length_with_gun=5.84*m;
length=6.68*m;
width_with_tracks=3.00*m;
height_to_cupola=2.45*m; // height including turret, should be 2.74 but that is probably including detail not yet added.
wheel_diam=0.8*m;
turret_pos=length*0.05; // Turret position measured from center of tank.
length_of_cannon=3*m;
height_to_hull=height_to_cupola*0.66; // height without turret
turret_height=height_to_cupola-height_to_hull;

// We can't print thinner than 1 mm so this may need to be adjusted 
// in small scales
cannon_outer_diam=0.25*m;


lower_wheel_1_x=length*0.30;
lower_wheel_2_x=length*0.15;
lower_wheel_3_x=length*0.0;
lower_wheel_4_x=-length*0.15;
lower_wheel_5_x=-length*0.30;
upper_front_wheel_x=length*0.9/2;
upper_rear_wheel_x=-length*0.9/2;

axle_margin=0.1;
axle_radius=2;

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
     translate([upper_front_wheel_x, 0, 0.4*height_to_hull])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2*0.8,width_with_tracks*0.2);


     // upper rear wheel
     translate([upper_rear_wheel_x, 0, 0.4*height_to_hull])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2*0.8,width_with_tracks*0.175);

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
  
}


module tracks()
{
   difference()
   {
      tracks_outer(1);
      translate([0,width_with_tracks*0.10,0])
      tracks_outer(0.7);
   }

   all_wheels(0.9);

}


module body()
{
  // lower body

  hull()
  {

    // lowest part of body
    translate([0, 0, 0.25*height_to_hull])
    cube([length*0.75,width_with_tracks*0.55,0.0001*height_to_hull], center=true);

    // middle part of body
    translate([0, 0, 0.45*height_to_hull])
    cube([length,width_with_tracks*0.66,height_to_hull*0.1], center=true);

    // highest part of body
    translate([-length*0.075, 0, 0.99*height_to_hull])
    cube([length*0.60,width_with_tracks*0.55,0.0001*height_to_hull], center=true);
  }



  // mount for turret
  translate([turret_pos, 0, height_to_hull])
  h_cylinder(width_with_tracks*0.22,height_to_hull*0.1);

  // Some sort of feature often seen on upper rear part of hull
  translate([-length*0.25, width_with_tracks*0.35, 0.85*height_to_hull])
  rotate([0,90,0])
  h_cylinder(width_with_tracks*0.08,length*0.15);

  // Same as previous but other side
  translate([-length*0.25, -width_with_tracks*0.35, 0.85*height_to_hull])
  rotate([0,90,0])
  h_cylinder(width_with_tracks*0.08,length*0.15);



/*
  // Drivers viewing hatch
  translate([-length*0.15/2 + length*0.85/2, width_with_tracks*0.15, 0.75*height_to_hull])
  cube([length*0.02,width_with_tracks*0.18,height_to_hull*0.1], center=true);


  // front machine gun
  translate([-length*0.15/2 + length*0.85/2, -width_with_tracks*0.15, 0.75*height_to_hull])
  sphere(width_with_tracks*0.035,$fs=0.5);


  // engine hood or whatever, needed to put something there
  translate([-length*0.4, 0, 0.84*height_to_hull])
  cube([length*0.15,length*0.3,height_to_hull*0.1], center=true);


  // left hatch (drivers hatch)
  translate([length*0.28, width_with_tracks*0.17, 0.84*height_to_hull])
  h_cylinder(width_with_tracks*0.07,height_to_hull*0.06);

  // right hatch 
  translate([length*0.28, -width_with_tracks*0.17, 0.84*height_to_hull])
  h_cylinder(width_with_tracks*0.07,height_to_hull*0.06);
*/
}


module cannon()
{
    // cannon fitting
    translate([0, 0, 0])
    rotate([0,90,0])
    h_cylinder(cannon_outer_diam,width_with_tracks*0.2);

    translate([0, 0, 0.5*length_of_cannon])
    h_cylinder(cannon_outer_diam/2,length_of_cannon);

    translate([0, 0, 0.2*length_of_cannon])
    h_cylinder(1.8*cannon_outer_diam/2,0.2*length_of_cannon);

}



module turret()
{

  hull()
  {

    // lower rear part of turret
    translate([-length*0.45/4, 0, turret_height*0.1])
    cube([1.2*length*0.25/2,1.2*width_with_tracks*0.3,turret_height*0.1], center=true);

    // lower front part
    translate([length*0.45/4, 0, turret_height*0.1])
    cube([2.3*length*0.07/2,1*width_with_tracks*0.35,turret_height*0.1], center=true);

    // lower center part
    translate([0, 0, turret_height*0.1])
    h_cylinder(1.2*width_with_tracks*0.55/2,turret_height*0.1);

    // upper rear part of turret
    translate([-length*0.45/4, 0, turret_height/2])
    cube([length*0.25/2,width_with_tracks*0.3,turret_height*0.9], center=true);

    // upper front part
    translate([length*0.45/4, 0, turret_height/2])
    cube([length*0.07/2,width_with_tracks*0.35,turret_height*0.9], center=true);

    // upper center part
    translate([0, 0, turret_height/2])
    h_cylinder(width_with_tracks*0.55/2,turret_height);

    // cannon fitting left side
    translate([0.14*length, width_with_tracks*0.1, turret_height/2])
    rotate([85,0,90])
    translate([0, 0, 0])
    rotate([0,90,0])
    sphere(cannon_outer_diam*2,$fn = 12);

    // cannon fitting right side
    translate([0.14*length, -width_with_tracks*0.1, turret_height/2])
    rotate([85,0,90])
    translate([0, 0, 0])
    rotate([0,90,0])
    sphere(cannon_outer_diam*2,$fn = 12);

  }


  
/*
  // observation hatch
  translate([-length*0.08, 0.14*width_with_tracks, height_to_hull*1.25])
  h_cylinder(0.10*width_with_tracks,height_to_hull*0.33);


  // small hatch
  translate([-length*0.00, -0.2*width_with_tracks, height_to_hull*1.25])
  h_cylinder(0.08*width_with_tracks,height_to_hull*0.2);

  // vent
  translate([length*0.03, 0, height_to_hull*1.25])
  h_cylinder(0.03*width_with_tracks,height_to_hull*0.2);

  // periscope?
  translate([length*0.12, -0.10*width_with_tracks, height_to_hull*1.25])
  cube([length*0.03,length*0.03,length*0.05], center=true);
*/

  // cannon
  translate([0.14*length, 0, turret_height/2])
  rotate([85,0,90])
  cannon();
}

module body_and_tracks()
{
  difference() 
  {
    body();

    // axle to mount turret on
    translate([turret_pos, 0, height_to_hull])
    rotate([0,0,90])
    h_cylinder(axle_radius,7);

    translate([turret_pos, 0, height_to_hull-3])
    rotate([0,0,90])
    h_cylinder(axle_radius+axle_margin*10,4);

  }

  // right tracks
  mirror([0,1,0])
  translate([0, width_with_tracks*0.4, 0])
  tracks();

  // left tracks
  translate([0, width_with_tracks*0.4, 0])
  tracks();


}

module turret_with_axle()
{
  translate([turret_pos, 0, height_to_hull+0.5])
  {
    turret();

    // axle for turret

    rotate([0,0,90])
    h_cylinder(axle_radius-axle_margin,6);

    rotate([0,0,90])
    translate([0, 0, -4])
    h_cylinder(axle_radius,2);

  }


}

module body_and_tracks_standing()
{
    

  difference() 
  {
    rotate([0,-90,0])
    translate([length*0.490,0,0])
    body_and_tracks();
    h_mask_lower_z();
  }

  translate([-height_to_hull*0.50,3,0])
  printing_supports(8,8, 6);

  translate([-height_to_hull*0.50,3,0])
  printing_supports(14, 14, 6);


  translate([-height_to_hull*0.50,-3,0])
  printing_supports(8,8, 6);

  translate([-height_to_hull*0.50,-3,0])
  printing_supports(14, 14, 6);

}


module turret_standing()
{
    
  translate([13, 0, 0])
  difference() 
  {
    rotate([0,-90,0])
    translate([length*0.135,0,0])
    turret_with_axle();
    h_mask_lower_z();
  }

  printing_supports(7.5,5,4);
  translate([6.5, 0, 4])
  cube([2,0.5,8], center=true);

}


// add some support to help printer, intended to be broken of after printing.
module printing_supports(x_offset, z_height, pad_size)
{

  hull()
  {
    translate([x_offset, 0, 0.5])
    cube([1,0.5,1], center=true);

    translate([0, 0, z_height])
    cube([1,0.5,1], center=true);
  }

  hull()
  {
    translate([-x_offset, 0, 0.5])
    cube([1,0.5,1], center=true);

    translate([0, 0, z_height])
    cube([1,0.5,1], center=true);
  }


    translate([x_offset, 0, 1])
    cube([pad_size,pad_size,2], center=true);

    translate([-x_offset, 0, 1])
    cube([pad_size,pad_size,2], center=true);

}


module all()
{
  body_and_tracks();
  turret_with_axle();
}


// model needs to be printed in 2 pieces,
// preferably in a vertical position, that is standing on its back

// uncomment one of these when exporting to stl:

all();
//body_and_tracks();
//turret_with_axle();
//body_and_tracks_standing();
//turret_standing();



