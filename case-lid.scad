
include <config.scad>;
use <cantact/cantact.scad>;
use <case-bottom.scad>;

module side_screw_support()
{
    difference()
    {
        translate([
            side_screw_support_x - side_screw_support_size_x/2,
            0,
            case_offset_z + bottom_piece_height - side_screw_support_size_z
            ])
        cube([
            side_screw_support_size_x,
            side_screw_support_size_y,
            side_screw_support_size_z + nothing
            ]);

        // Cut a hole for the screws
        translate([
            side_screw_terminal_x,
            0,
            side_screw_terminal_z
            ])
        rotate([-90, 0, 0])
        translate([0, 0, -nothing])
        cylinder(
            r = side_screw_terminal_diameter/2,
            h = side_screw_support_size_y + 2*nothing
            );
    }
}

module lid_border()
{
    difference()
    {
        cube([
            pcb_x + expansion_x,
            pcb_y + expansion_y,
            wall_thickness
            ]);

        // Remove the inside of the above cube to leave only the border
        translate([
            lid_border_width,
            lid_border_width,
            -nothing
            ])
        cube([
            pcb_x + expansion_x - 2*lid_border_width,
            pcb_y + expansion_y - 2*lid_border_width,
            wall_thickness + 2*nothing
            ]);
    }
}

module case_lid()
{
    // Top plane
    difference()
    {
        translate([
            case_offset_x,
            case_offset_y,
            case_offset_z + bottom_piece_height
            ])
        cube([
            case_x,
            case_y,
            wall_thickness
            ]);

        // LED window
        translate([
            led_window_x,
            led_window_y,
            case_offset_z + bottom_piece_height - nothing
            ])
        cube([
            led_window_size_x,
            led_window_size_y,
            wall_thickness + 2*nothing
            ]);
    }

    // Inset border plane
    translate([
        case_offset_x + wall_thickness,
        case_offset_y + wall_thickness,
        case_offset_z + bottom_piece_height - lid_border_inset
        ])
    lid_border();

    // Front plane support
    translate([0, -expansion_y/2, 0])
    side_screw_support();

    // Back plane support
    translate([0, pcb_y + expansion_y/2, 0])
    mirror([0, 1, 0])
    side_screw_support();
}

cantact();
#case_bottom();
case_lid();
