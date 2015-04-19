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
length=5.84*m;
width_with_tracks=2.62*m;
height_to_cupola=2.65*m; // height including turret, should be 2.74 but that is probably including detail not yet added.
wheel_diam=0.7*m;
turret_pos=0.5*m; // Turret position measured from center of tank.
length_of_cannon=1.4*m;
height_to_hull=height_to_cupola*0.72; // height without turret
turret_height=height_to_cupola-height_to_hull;

// We can't print thinner than 1 mm so this may need to be adjusted 
// in small scales
cannon_outer_diam=0.2*m;


lower_wheel_1_x=length*0.30;
lower_wheel_2_x=length*0.18;
lower_wheel_3_x=length*0.06;
lower_wheel_4_x=-length*0.06;
lower_wheel_5_x=-length*0.18;
lower_wheel_6_x=-length*0.30;
upper_front_wheel_x=length*0.84/2;
upper_rear_wheel_x=-length*0.84/2;

// uncomment one of the below

//all_together();



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
     translate([upper_front_wheel_x, 0, 0.45*height_to_hull])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.2);


     // upper rear wheel
     translate([upper_rear_wheel_x, 0, 0.45*height_to_hull])
     rotate([90,0,0])
     h_cylinder(wheel_diam*factor/2,width_with_tracks*0.175);

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

  translate([0, 0, 0.45*height_to_hull])
  hull()
  {

    // lowest part of body
    translate([0, 0, 0.0*height_to_hull])
    cube([length*0.95,width_with_tracks*0.75,height_to_hull*0.10], center=true);

    // middle part of body
    translate([-length*0.25/2, 0, 0.05*height_to_hull])
    cube([length*0.70,width_with_tracks*0.66,height_to_hull*0.3], center=true);

    // highest part of body
    translate([length*0.15/2, 0, 0.32*height_to_hull])
    cube([length*0.35,width_with_tracks*0.55,0.50*height_to_hull], center=true);
  }



  // mount for turret
  translate([turret_pos, 0, height_to_hull])
  h_cylinder(width_with_tracks*0.22,height_to_hull*0.1);


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

}



module turret()
{


  hull()
  {
    // rear part of turret
    translate([-length*0.45/4, 0, turret_height/2])
    cube([length*0.20/2,width_with_tracks*0.25,turret_height*0.9], center=true);

    // front part
    translate([length*0.45/4, 0, turret_height/2])
    cube([length*0.07/2,width_with_tracks*0.25,turret_height*0.9], center=true);

    // center part
    translate([0, 0, turret_height/2])
    h_cylinder(width_with_tracks*0.55/2,turret_height);
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
  translate([0.11*length, 0, turret_height/2])
  rotate([85,0,90])
  cannon();
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
  translate([turret_pos, 0, height_to_hull])
  rotate([0,0,90])
  h_cylinder(2,7);

}

module turret_with_mounting_hole()
{
  translate([turret_pos, 0, height_to_hull+0.5])
  difference() 
  {
    turret();

    // hole for axle for turret
    rotate([0,0,90])
    h_cylinder(2.1,4*1.2);
  }


}

module body_and_tracks_standing()
{
    

  difference() 
  {
    rotate([0,-90,0])
    translate([length*0.470,0,0])
    body_and_tracks();
    h_mask_lower_z();
  }
}


module turret_standing()
{
    
  difference() 
  {
    rotate([0,-90,0])
    translate([length*0.10,0,0])
    turret_with_mounting_hole();
    h_mask_lower_z();
  }
}


module all()
{
  body_and_tracks();
  turret_with_mounting_hole();
}


// model needs to be printed in 2 pieces,
// preferably in a vertical position, that is standing on its back

// uncomment one of these when exporting to stl:

all();
//body_and_tracks();
//turret_with_mounting_hole();
//body_and_tracks_standing();
//turret_standing();



