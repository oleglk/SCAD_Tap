// tap_params.scad

EPS = 0.0001;
TOLERANCE = 0.1;
MIN_THICK = 2.5;

GRIP_DIAMETER  = 30;  // OK_TMP:small; TODO: normal is 45-50
INNER_TOP_XY    = [15, 11];
INNER_BOTTOM_XY = [15, 13.5];
INNER_DIAMETER = INNER_TOP_XY.y + 2 * 1.0;
HEIGHT          = 11;

GRIP_NUM_SIDES  = 3;  // >=3
