//------------------------------------------------------------------------------------------------
//  Printable M8 hex nut
//----------------------------------------------------------------------------------------------
// (c) Juan Gonzalez-Gomez (Obijuan), July-2012
// Based on the wonderful ISO Metric Thread by Trevor Moseley
//---------------------------------------------------------------------------------------------
//-- GPL License
//----------------------------------------------------------------------------------------------
use <ISOThread.scad>

//-------------------------------------------------------------------------------------------------
//-- Parameterized ISO M8 Nut
//-- dia:  Hex nut outer diam
//-- hi:  Hex nut height
//-- When no parameters are give, standar dimension are used
//-------------------------------------------------------------------------------------------------
module hex_nut_M8(dia=14.6, hi=6.5)
{
	difference() {
	  cylinder(r = dia/2,h = hi, $fn=6);
        translate([0,0,-0.1])	cylinder(r = 8/2, h =hi + 0.2);
	}
	translate([0,0,0.1])	thread_in(8,hi-0.2);
}


//-------------------
//-- Examples:
//--------------------

//-- Standard nut
hex_nut_M8();

//-- Doble height hex_nut
//hex_nut_M8(hi=13);

//-- Wider hex nut
//hex_nut_M8(dia=20);








