
include <config.scad>
use <cantact/cantact.scad>;

module bottom_side_usb()
{
    translate([case_offset_x + case_x - wall_thickness, 0, 0])
    difference()
    {
        translate([
            0,
            case_offset_y,
            case_offset_z
            ])
        cube([
            wall_thickness,
            case_y,
            case_z
            ]);
        
        // Cut a hole for the USB plug and cable
        translate([
            -nothing,
            usb_cutout_offset_y,
            usb_cutout_offset_z
            ])
        cube([
            wall_thickness + 2*nothing,
            usb_cutout_y,
            usb_cutout_z
            ]);
    }
}

cantact();
bottom_side_usb();
