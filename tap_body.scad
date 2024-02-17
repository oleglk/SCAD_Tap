// tap_body.scad

include <tap_params.scad>

module TapBody()  {
  difference()  {
    cylinder(h = HEIGHT,  d = GRIP_DIAMETER,  center=true,
             $fn = GRIP_NUM_SIDES);

    _scaleXY  = [INNER_TOP_XY.x / INNER_BOTTOM_XY.x,
                 INNER_TOP_XY.y / INNER_BOTTOM_XY.y];
    translate([0, 0, -2*EPS])
    linear_extrude(height = HEIGHT+10*EPS, center = true, scale = _scaleXY)
    square(size = INNER_BOTTOM_XY, center = true);
  }
}//_END_OF__module_TapBody

TapBody();
