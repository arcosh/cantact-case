
include <config.scad>;
use <case-lid.scad>;

module part_lid()
{
    translate([
        -case_offset_x,
        -case_offset_y,
        bottom_piece_height + case_offset_z + wall_thickness
        ])
    mirror([0, 0, 1])
    case_lid();
}

part_lid();
