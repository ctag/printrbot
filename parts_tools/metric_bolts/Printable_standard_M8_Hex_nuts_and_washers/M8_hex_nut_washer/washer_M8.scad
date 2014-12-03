//------------------------------------------------------------------------------------------------
//  Printable M8 wahser
//----------------------------------------------------------------------------------------------
// (c) Juan Gonzalez-Gomez (Obijuan), July-2012
//---------------------------------------------------------------------------------------------
//-- GPL License
//----------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------
//-- Parameterized M8 washer
//-- dia:  washer outer diam
//-- hi:  washer height
//-- When no parameters are give, standar dimension are used
//-----------------------------------------------------------------------------------------------
module washer_M8(dia=15.8, hi=1.5)
{
  translate([0,0,hi/2])
  difference() {
    cylinder(r=dia/2, h=hi, center=true, $fn=20);
    cylinder(r=8.5/2, h=hi + 0.2, center=true);
  }
}

//-------------------
//-- Examples:
//--------------------

//-- Standard washer
washer_M8();

//-- Extra wide washer
//washer_M8(dia=20);








