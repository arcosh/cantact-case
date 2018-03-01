
include <config.scad>;
use <cantact/cantact.scad>;

module bottom_side_can()
{
    difference()
    {
        translate([
            case_offset_x,
            case_offset_y,
            case_offset_z
            ])
        cube([
            wall_thickness,
            case_y,
            case_z
            ]);
        
        // Cut a hole for the D-Sub connector
        translate([
            case_offset_x - 2*nothing,
            dsub_cutout_offset_y,
            dsub_cutout_offset_z
            ])
        cube([
            wall_thickness + 4*nothing,
            dsub_cutout_y,
            dsub_cutout_z
            ]);
    }
}

cantact();
bottom_side_can();
