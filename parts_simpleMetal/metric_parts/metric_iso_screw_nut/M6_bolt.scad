/*
 *    based on:
 *    polyTests.scad    by aubenc @ Thingiverse
 *    adapted to test:
 *    metric_iso_screw_test.scad  by stth
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

/*
 * creates a screw with hex head an iso thread
 * the fillet in the valleys is not round but a flat.
 * it has the same depht as the lowest part of the round would have.
 *
 * @param d    ISO diameter M<od>
 *             using values between the standardised diameters
 *             may result in strange measures for the width across flat (tool size)
 * @param lt   length of thread
 * @param cs   create cone-cut at the end of thread (for easier handling)
 *             --   -1  only on the head side of the thread
 *             --    0  none
 *             --    1  only at the end of the screw
 *             --    2  at both ends if the thread
 * @param ntl  length of the part between head and upper end of thread
 * @param ntd  diameter  of the part between head and upper end of thread
 *             --  > 0  explicit diameter
 *             --    0  use value of parameter od
 *             --   -1  use diameter of the thread valleys
 * @param hg   height of the head,
 * @param $fn  should be 30 minimum (do not use $fs or $fa)
 */
hex_screw_iso(
		d=6,
		lt=34,
		cs=2,
		ntl=1,
		ntd=6,
		hg=3,
		$fn=60
	);
