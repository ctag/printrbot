/*
 *    based on:
 *    polyTests.scad    by aubenc @ Thingiverse
 *    adapted to test:
 *    metric_iso_screw_gallery.scad  by stth
 *
 * This script contains few examples to show how to use the modules
 * included in the library script: 	polyScrewThead_r1_iso.scad
 *
 * http://www.thingiverse.com/thing:8796
 * http://www.thingiverse.com/thing:269863
 *
 * CC Public Domain
 */
use <metric_iso_screw.scad>

function set(d) = lookup(d,[
[1, 1],
[2, 2],
[3, 3],
[4, 4],
[5, 10],
[6, 8],
[7, 6],
[8, 5]
]);

for (x = [0:1])
{
	for (y = [1:4])
	{
		assign (i = 4*x + y)
		{
			assign (di=set(i))
			translate([x*12, (y-1)*12 + x*(y-2)*8, 0])
			{
				hex_screw_iso(
						d=di,
						lt=di*2,
						cs=2,
						ntl=di*0.6,
						ntd=0,
						hg=di/1.7,
						$fn=60
					);
				
				translate([0, 0 , di/2 + di*0.6 + 6*get_iso_pitch(di)])
				hex_nut_iso(
						d=di,
						hg=di/1.2,
						$fn=60
					);
			}
		}
	}
}
