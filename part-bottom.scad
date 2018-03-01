
include <config.scad>;
use <case-bottom.scad>;

module part_bottom()
{
    translate([
        -case_offset_x,
        -case_offset_y,
        -case_offset_z
        ])
    case_bottom();
}

part_bottom();
