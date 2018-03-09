
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
    // Derivative measures
    lid_border_outside_size_x = pcb_x + expansion_x - 2*lid_border_inset_x;
    lid_border_outside_size_y = pcb_y + expansion_y - 2*lid_border_inset_y;
    lid_border_inside_size_x = pcb_x + expansion_x - 2*lid_border_width - 2*lid_border_inset_x;
    lid_border_inside_size_y = pcb_y + expansion_y - 2*lid_border_width - 2*lid_border_inset_y;

    difference()
    {
        // A cube with approximately the size of the CANtact PCB
        cube([
            lid_border_outside_size_x,
            lid_border_outside_size_y,
            lid_border_height
            + nothing       // ensure object unification with lid's top plane
            ]);

        // Remove the inside of the above cube to leave only the border
        translate([
            lid_border_width,
            lid_border_width,
            -nothing
            ])
        cube([
            lid_border_inside_size_x,
            lid_border_inside_size_y,
            lid_border_height + 2*nothing
            ]);
    }
}

module case_lid()
{
    // Derivative measure: LED window coordinates
    led_window_x = (led1_x + led2_x)/2 - led_window_size_x/2;
    led_window_y = led1_y - led_window_size_y/2;

    difference()
    {
        union()
        {
            // Lid's top plane
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

            // Add lid border
            translate([
                case_offset_x + wall_thickness + lid_border_inset_x,
                case_offset_y + wall_thickness + lid_border_inset_y,
                case_offset_z + bottom_piece_height - lid_border_height
                ])
            lid_border();
        }

        // Cut out LED window
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
