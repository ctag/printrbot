// Generate a resistor/diode lead bending tool
// Dan Newman, dan dot newman @ mtbaldy dot us
// 30 June 2012

// Slicing layer height
layer_height = 0.3;

// spacing between each position
spacing = 6.0;

// Diameter of resistor leads
wire_d = 1.50;

// ---------------------
// Short/small resistors

// First bending width
start_w = 0.4 * 25.4;  // Imperial

// Final bending width
// end_w = 1.0 * 25.4;
end_w = 1.5 * 25.4; // Nice long bender, but too long for a 10 x 10 cm build area

// Steps between each bending width
step_w = 0.05 * 25.4;

// Width and depth of the trough/ditch to place the resistors in
trough_w = 6.75;
trough_d = 2.10;

// -----------------------
// Medium sized resistors

// First bending width
//start_w = 0.6 * 25.4;  // Imperial

// Final bending width
//end_w = 1.0 * 25.4;
//end_w = 1.5 * 25.4; // Nice long bender, but too long for a 10 x 10 cm build area

// Steps between each bending width
//step_w  = 0.05 * 25.4;

// Width and depth of the trough/ditch to place the resistors in
//trough_w = 10.5;
//trough_d = 3.00;

// -------------
// Miscellaneous

// Corner radius for corners of the plate
corner_r = 2.0;


// -----------------------
// Derived values follow

// Thickness of the tool
thickness = 2 * trough_d;

// Round up to the nearest multiple of a layer height
H = thickness + layer_height*(1.0+floor(thickness/layer_height)-(thickness/layer_height));

// Number of positions
N = ceil( 1 + ( end_w - start_w ) / step_w );

// Starting and ending slot widths with allowances for the wire diameters
W_1 = start_w - wire_d;
W_N = end_w   - wire_d;

// To determine the actual starting and ending widths, consider the
// line segment drawn between the first slot of width W_1 and the final
// slot of width W_N and spaced (N-1)*spacing away.
P1 = [W_1 / 2, (N - 1)*spacing];
P2 = [W_N / 2, 0];

// We wish to find the X coordinates X0 and X3 of the points
//
//   P0 = [X0, N * spacing]
//   P3 = [X3, -spacing]
//
// on the line through P1 & P2.  The equation of the line as a function of y is
//
//   L(y) = P2[0] + y * ( P1[0] - P2[0] ) / ( P1[1] - P2[1] ) 
P0 = [P2[0] + N * spacing * ( P1[0] - P2[0] ) / ( P1[1] - P2[1] ), N * spacing];
P3 = [P2[0] - spacing * ( P1[0] - P2[0] ) / ( P1[1] - P2[1] ), -spacing];

// Overall length (we use for centering the piece)
L = P0[1] - P3[1] + P0[0] * 1.25;

module plate()
{
    difference()
    {
        union()
        {
            hull()
            {
                 translate([P0[0] - corner_r, P0[1] - corner_r, 0])
                     cylinder(h=H, r=corner_r, center=false, $fn=50);
                 translate([-P0[0] + corner_r, P0[1] - corner_r, 0])
                     cylinder(h=H, r=corner_r, center=false, $fn=50);
                 translate([P3[0] - corner_r, P3[1] + corner_r, 0])
                     cylinder(h=H, r=corner_r, center=false, $fn=50);
                 translate([-P3[0] + corner_r, P3[1] + corner_r, 0])
                     cylinder(h=H, r=corner_r, center=false, $fn=50);
            }
            translate([0, P0[1], 0])
                 cylinder(h=H, r=P0[0]*1.25, center=false, $fn=100);
        }
        translate([-trough_w/2, -2*spacing, H - trough_d])
            cube([trough_w, (N + 4) * spacing, H]);
        translate([0, P0[1], -(H+1)/2])
            cylinder(h=H+1, r=P0[0]*1.25/2, center=false, $fn=100);
    }
}

module slot(n)
{
	translate([-P3[0], P1[1] - n*spacing, H - trough_d/2])
      cube([P3[0]*2, wire_d, H]);
}

translate([0, -(L/2 + P3[1]), 0]) difference()
{
    plate();
    for (n = [0 : N-1])
    {
        slot(n);
    }
}

