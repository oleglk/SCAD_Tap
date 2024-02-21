// tap_body.scad

include <tap_params.scad>

module TapBody()  { // tap handle
  difference()  {
    union()  {  // main shape and protection from being too thin
      intersection() {
        cylinder(h = HEIGHT,  d = GRIP_DIAMETER,
                 center=true, $fn = GRIP_NUM_SIDES);
        cylinder(h = HEIGHT,  d = 0.9*GRIP_DIAMETER,
                 center=true, $fn = 25);
      }
      // min enclosure of tap axis, no matter main outer shape
      _innerDiag = sqrt(INNER_BOTTOM_XY.x^2 + INNER_BOTTOM_XY.y^2);
      cylinder(h = HEIGHT, d = _innerDiag +2*MIN_THICK,
               center=true, $fn = 15);
      
      translate([-1.5*3,  max(INNER_TOP_XY.y, INNER_DIAMETER)/2 + 0.5,  HEIGHT/2-EPS])
      text_area("TOP", font_size=3, depth=1, valign="bottom");
  }

    // subtract the remains of the old tap handle
    _scaleXY  = [INNER_TOP_XY.x / INNER_BOTTOM_XY.x,
                 INNER_TOP_XY.y / INNER_BOTTOM_XY.y];
    translate([0, 0, -2*EPS])
    union() {
      linear_extrude(height = HEIGHT+10*EPS, center = true, scale = _scaleXY)
      square(size = INNER_BOTTOM_XY, center = true);
      cylinder(h = HEIGHT,  d = INNER_DIAMETER +2*TOLERANCE,  center=true,
             $fn = 25);
    }
  }
}//_END_OF__module_TapBody

TapBody();


//////////////// Copied from TODO //////////////////////////////
// 3d text. depth < 0 simulates negative extrude direction
// (copied from BeamSplitter/bs_utils.scad)
module text_area(txt, font_size, depth=1,
                  halign="left", valign="center") {
  _ext_height = abs(depth);
  _z_shift = (depth < 0)? depth : 0;
  
  //if (depth < 0)  translate([0, 0, depth])
  translate([0, 0, _z_shift])
  linear_extrude( _ext_height, center=false )
  text(
      text = txt, 
      size = font_size, 
      font = "Liberation Mono", 
      valign = valign, 
      halign = halign,
      $fn = 50
  );
}//END_OF__text_area
////////////////////////////////////////////////////////////////
