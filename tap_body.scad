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
