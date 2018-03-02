
include <config.scad>;
use <case-lid.scad>;

module part_lid()
{
    rotate([180, 0, 0])
    translate([
        -case_offset_x,
        -case_offset_y - case_y,
        -bottom_piece_height - case_offset_z - wall_thickness
        ])
    case_lid();
}

part_lid();
