// These are some generic modules for openscad.
// Copyright (C) 2012 Henrik Björkman, www.eit.se, 
// May be distributed as under Gnu public license version 2.
//
// History
// Created 2012-09-25 By Henrik


// A holow centered cylinder
module h_holow_cylinder(outer_radius, inner_radius, hight)
{
  difference() 
  {
    cylinder(hight,outer_radius,outer_radius,$fn=90, center=true);
    cylinder(hight,inner_radius,inner_radius,$fn=90, center=true);
  }
}


// A simple centered cylinder
module h_cylinder(radius, hight)
{
  //cylinder(hight,radius,radius,$fn=90, center=true);
  cylinder(hight,radius,radius,$fs=0.5, center=true);
}


// Internal module used by h_triangle_with_screw_holes
module h_rounded_triangle(width, depth)
{
    hull() 
    {
       translate([width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);

       translate([-width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }

    hull() 
    {
       translate([width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);

       translate([0,depth,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }

    hull() 
    {
       translate([-width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);

       translate([0,depth,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }
}


// Use this if screw holes are needed at specified positions.
// The material is extended to go around the screw holes.
module h_triangle_with_screw_holes(width, depth, wall_thicknes,screw_hole_radius)
{
    difference() 
    {
      // En triangel
      h_rounded_triangle(width, depth);

      // med skruvhål i varje hörn

      translate([width/2,0,0])
      h_cylinder(screw_hole_radius,wall_thicknes);

      translate([-width/2,0,0])
      h_cylinder(screw_hole_radius,wall_thicknes);

      translate([0,depth,0])
      h_cylinder(screw_hole_radius,wall_thicknes);

    }


}

// Internal module used by h_trapetsoid_with_screw_holes
module h_rounded_trapetsoid(base_width, top_width, depth)
{
    hull() 
    {
       translate([base_width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
       translate([-base_width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }

    hull() 
    {
       translate([base_width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
       translate([top_width/2,depth,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }

    hull() 
    {
       translate([-base_width/2,0,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
       translate([-top_width/2,depth,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }

    hull() 
    {
       translate([top_width/2,depth,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
       translate([-top_width/2,depth,0]) h_cylinder(h_screw_hole_radius*2,h_wall_thicknes);
    }

}


// To be used when position of screw holes are to be at given positions. 
// Material is placed around those positions.
module h_trapetsoid_with_screw_holes(base_width, top_width, depth)
{
    translate([0,-depth/2,0])

    difference() 
    {
      h_rounded_trapetsoid(base_width, top_width, depth);

      // med skruvhål i varje hörn

      translate([base_width/2,0,0])
      h_cylinder(h_screw_hole_radius,h_wall_thicknes);

      translate([-base_width/2,0,0])
      h_cylinder(h_screw_hole_radius,h_wall_thicknes);

      translate([top_width/2,h_depth,0])
      h_cylinder(h_screw_hole_radius,h_wall_thicknes);

      translate([-top_width/2,h_depth,0])
      h_cylinder(h_screw_hole_radius,h_wall_thicknes);
    }
}


function h_distance2d(x1,y1,x2,y2) = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));


// Places a cylinder inside the tip of a triangle sort of.
module h_cylinder_inside(x0,y0,x1,y1,x2,y2,radius,height)
{
  //translate([x0,y0,0]) h_cylinder(1, height*2);//
  //translate([x1,y1,0]) h_cylinder(1, height*2);//
  //translate([x2,y2,0]) h_cylinder(1, height*2);//

  d01=h_distance2d(x0,y0,x1,y1);
  d02=h_distance2d(x0,y0,x2,y2);

  xn=x0-(x0-x2)*d01/d02;
  yn=y0-(y0-y2)*d01/d02;

  //translate([xn,yn,0]) h_cylinder(0.25, height*8);//

  xm=(x1+xn)/2;
  ym=(y1+yn)/2;

  //translate([xm,ym,0]) h_cylinder(0.5, height*4);//

  d1m=sqrt((xm-x1)*(xm-x1) + (ym-y1)*(ym-y1));
  d0m=sqrt((xm-x0)*(xm-x0) + (ym-y0)*(ym-y0));

  xc=x0+(xm-x0)*radius*d01/(d1m*d0m);
  yc=y0+(ym-y0)*radius*d01/(d1m*d0m);
  
  translate([xc,yc,0]) h_cylinder(radius, height);
}

// Places a smaller cylinder inside the tip of a triangle at the position where a larger one would fit.
module h_cylinder_inside_screw_hole(x0,y0,x1,y1,x2,y2,radius,height, hole_radius)
{
  //translate([x0,y0,0]) h_cylinder(1, height*2);
  //translate([x1,y1,0]) h_cylinder(1, height*2);
  //translate([x2,y2,0]) h_cylinder(1, height*2);

  d01=h_distance2d(x0,y0,x1,y1);
  d02=h_distance2d(x0,y0,x2,y2);

  xn=x0-(x0-x2)*d01/d02;
  yn=y0-(y0-y2)*d01/d02;

  //translate([xn,yn,0]) h_cylinder(0.25, height*8);

  xm=(x1+xn)/2;
  ym=(y1+yn)/2;

  //translate([xm,ym,0]) h_cylinder(0.5, height*4);

  d1m=sqrt((xm-x1)*(xm-x1) + (ym-y1)*(ym-y1));
  d0m=sqrt((xm-x0)*(xm-x0) + (ym-y0)*(ym-y0));

  xc=x0+(xm-x0)*radius*d01/(d1m*d0m);
  yc=y0+(ym-y0)*radius*d01/(d1m*d0m);
  
  translate([xc,yc,0]) h_cylinder(hole_radius, height);
}





// A triangle with rounded corners
// Use this if the outer rim of the triangle is known.
module h_rounded_3_corners(x1,y1,x2,y2,x3,y3,radius,height)
{
   // Place 3 circles and fill the area between them.

  hull() 
  {
    h_cylinder_inside(x1,y1,x2,y2,x3,y3,radius,height);
    h_cylinder_inside(x2,y2,x1,y1,x3,y3,radius,height);
    h_cylinder_inside(x3,y3,x2,y2,x1,y1,radius,height);
  }
}


// A triangle with rounded corners
// Use this if the outer rim of the triangle is known.
// Screw holes are placed near the corners.
module h_rounded_3_corners_screw_holes(x1,y1,x2,y2,x3,y3,radius,height, hole_radius)
{
   // Place 3 circles and fill the area between them.

  difference() 
  {
    h_cylinder_inside(x1,y1,x2,y2,x3,y3,radius,height);
    h_cylinder_inside_screw_hole(x1,y1,x2,y2,x3,y3,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x2,y2,x1,y1,x3,y3,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x3,y3,x2,y2,x1,y1,radius,height,hole_radius);    
  }
}



// 4 corners with rounded corners
// The corners must be in order 1,2,3,4 so 
// that 1 is opposite 3 and 2 is opposite 4.
//
//   1------4
//   |      |
//   |      |
//   2------3
//
// If not it will not be correctly dimensioned. It will be too small!
//
module h_rounded_4_corners(x1,y1,x2,y2,x3,y3,x4,y4,radius,height)
{

  hull() 
  {
    h_cylinder_inside(x1,y1,x2,y2,x4,y4,radius,height);
    h_cylinder_inside(x2,y2,x1,y1,x3,y3,radius,height);
    h_cylinder_inside(x3,y3,x2,y2,x4,y4,radius,height);
    h_cylinder_inside(x4,y4,x1,y1,x3,y3,radius,height);
  }
}


// 4 corners with rounded corners and screw holes
// The corners must be in order 1,2,3,4 so 
// that 1 is opposite 3 and 2 is opposite 4.
//
//   1------4
//   |      |
//   |      |
//   2------3
//
module h_rounded_4_corners_screw_holes(x1,y1,x2,y2,x3,y3,x4,y4,radius,height, hole_radius)
{

  difference() 
  {
    h_rounded_4_corners(x1,y1,x2,y2,x3,y3,x4,y4,radius,height);
    h_cylinder_inside_screw_hole(x1,y1,x2,y2,x4,y4,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x2,y2,x1,y1,x3,y3,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x3,y3,x2,y2,x4,y4,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x4,y4,x1,y1,x3,y3,radius,height,hole_radius);
    
  }
}




// Internal module used by h_frame_with_4_rounded_corners
module h_rounded_4_corners_inner_frame(x1,y1,x2,y2,x3,y3,x4,y4,radius,height, hole_radius)
{
   // Place 3 circles and fill the area between them.

  hull() 
  {
    h_cylinder_inside_screw_hole(x1,y1,x2,y2,x4,y4,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x2,y2,x1,y1,x3,y3,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x3,y3,x2,y2,x4,y4,radius,height,hole_radius);
    h_cylinder_inside_screw_hole(x4,y4,x1,y1,x3,y3,radius,height,hole_radius);
  }
}


// 4 corners with rounded corners
// The corners must be in order 1,2,3,4 so 
// that 1 is opposite 3 and 2 is opposite 4.
// If not it will not be correctly dimensioned. It will be too small!
//
// It shall be like this:
//
//   1------4
//   |      |
//   |      |
//   2------3
//
// That is NOT like this:
//
//   1------3
//   |      |   This will be interpreted as a "time glass" shape.
//   |      |
//   2------4
//
//
module h_frame_with_4_rounded_corners(x1,y1,x2,y2,x3,y3,x4,y4,radius,height)
{
  difference() 
  {
    h_rounded_4_corners(x1,y1,x2,y2,x3,y3,x4,y4,radius,height);
    h_rounded_4_corners_inner_frame(x1,y1,x2,y2,x3,y3,x4,y4,radius*2,height,radius);
  }
}



//http://en.wikibooks.org/wiki/OpenSCAD_User_Manual/2D_to_3D_Extrusion
module h_torus(torus_radius, circle_radius)
{
  rotate_extrude(convexity = 10, $fn = 36)
  translate([torus_radius, 0, 0])
  circle(r = circle_radius, $fn = 36, center=true);
}


module h_torus_low_res(torus_radius, circle_radius)
{
  rotate_extrude(convexity = 10, $fn = 12)
  translate([torus_radius, 0, 0])
  circle(r = circle_radius, $fn = 12, center=true);
}

// Total hight will be 2*circle_radius+additional_hight
module h_streched_torus(torus_radius, circle_radius, additional_hight)
{
  if (additional_hight>0)
  {
   union()
   {
    h_holow_cylinder(torus_radius+circle_radius, torus_radius-circle_radius, additional_hight);

    translate([0, 0, additional_hight/2])
    h_torus(torus_radius, circle_radius);

    translate([0, 0, -additional_hight/2])
    h_torus(torus_radius, circle_radius);
   }
  }
  else
  {
    h_torus(torus_radius, circle_radius);
  }
}


module h_torus_half(torus_radius, circle_radius, angle)
{
  difference()
  {
    h_torus_low_res(torus_radius, circle_radius);
    translate([0, -torus_radius*2, -torus_radius/2])
    cube([torus_radius*2,torus_radius*4,torus_radius]);
  }
  translate([0, -torus_radius, 0])
  sphere(circle_radius, $fn = 12);
  translate([0, torus_radius, 0])
  sphere(circle_radius, $fn = 12);
}



// Use this to mask out everything below the xy plane
module h_mask_lower_z()
{
  translate([-100,-100,-100])
  cube([200,200,100]);
}


// Rounded plate
// Total hight will be 2*circle_radius+additional_hight
module h_rounded_plate(torus_radius, circle_radius, additional_hight)
{
  hull()
  {
    h_streched_torus(torus_radius, circle_radius, additional_hight);
  }
}


// Rounded plate
// Total hight will be 2*circle_radius+additional_hight
module h_rounded_plate_with_cone(torus_radius, circle_radius, additional_hight)
{
  hull()
  {
    h_streched_torus(torus_radius, circle_radius, additional_hight);
    cylinder(additional_hight/2+circle_radius*2, torus_radius, 0);
  }
}


module h_rod_rounded_ends(hight, radius)
{
  hull()
  {
    sphere(radius, $fn = 12);
    translate([0,hight,0])
    sphere(radius, $fn = 12);
  }
}




module letter_E(size)
{
  h_rod_rounded_ends(size,size/8);

  rotate([0,0,-90])
  h_rod_rounded_ends(size/2,size/8);

  translate([0,size/2, 0]) 
  rotate([0,0,-90])
  h_rod_rounded_ends(size/2,size/8);

  translate([0,size, 0]) 
  rotate([0,0,-90])
  h_rod_rounded_ends(size/2,size/8);
}

module letter_I(size)
{
  translate([size*0.25, 0, 0]) 
  h_rod_rounded_ends(size,size/8);
}

module letter_S(size)
{
  translate([-size*0.1, size*0.1, 0]) 
  rotate([0,0,-15])
  {
  translate([size*0.25, size*0.75, 0]) 
  h_torus_half(size/4, size/8, 180);

  translate([size*0.25, size*0.25, 0]) 
  rotate([0,0,180])
  h_torus_half(size/4, size/8, 180);
  }
}


module letter_T(size)
{
  translate([size*0.5, 0, 0]) 

  h_rod_rounded_ends(size,size/8);

  translate([size*0.1,size, 0]) 
  rotate([0,0,-90])
  h_rod_rounded_ends(size*0.8,size/8);

}

module letter_W(size)
{
  translate([size*0.3, 0, 0]) 
  rotate([0,0,15])
  h_rod_rounded_ends(size,size/7);

  translate([size*0.3, 0, 0]) 
  rotate([0,0,-15])
  h_rod_rounded_ends(size,size/7);

  translate([size*0.7, 0, 0]) 
  rotate([0,0,15])
  h_rod_rounded_ends(size,size/7);

  translate([size*0.7, 0, 0]) 
  rotate([0,0,-15])
  h_rod_rounded_ends(size,size/7);

}

module dot(size)
{
  translate([size*0.25, 0, 0]) 
  h_rod_rounded_ends(size/8,size/8);
}

