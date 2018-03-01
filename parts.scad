
include <config.scad>;
use <case-bottom.scad>;
use <case-lid.scad>;

spacing = 5;

translate([
    -case_offset_x,
    -case_offset_y,
    -case_offset_z
    ])
case_bottom();

translate([
    -case_offset_x,
    case_y + spacing,
    bottom_piece_height + case_offset_z + wall_thickness
    ])
mirror([0, 0, 1])
case_lid();
