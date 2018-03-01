
include <config.scad>
use <cantact/cantact.scad>;
use <pcb-screw-terminal.scad>;
use <pcb-support.scad>;
use <bottom-side-can.scad>;
use <bottom-side-usb.scad>;

module side_plane()
{
    difference()
    {
        translate([
            case_offset_x,
            case_offset_y,
            case_offset_z
            ])
        cube([
            case_x,
            wall_thickness,
            bottom_piece_height
            ]);

        // Cut a hole for the screws
        translate([
            side_screw_terminal_x,
            0,
            side_screw_terminal_z
            ])
        rotate([90, 0, 0])
        translate([0, 0, -nothing])
        cylinder(
            r = side_screw_terminal_diameter/2,
            h = side_screw_support_size_y + 2*nothing
            );
    }
}

/**
 * The case's bottom piece
 */
module case_bottom()
{
    // Bottom plane
    translate([
        case_offset_x,
        case_offset_y,
        case_offset_z
        ])
    cube([
        case_x,
        case_y,
        wall_thickness
        ]);

    // Screw terminals
    translate([
        pcb_hole1_x,
        pcb_hole1_y,
        -pcb_bottom_layer_parts_height - pcb_thickness
        ])
    pcb_screw_terminal();

    translate([
        pcb_hole2_x,
        pcb_hole2_y,
        -pcb_bottom_layer_parts_height - pcb_thickness
        ])
    pcb_screw_terminal();

    // PCB supports
    translate([
        pcb_support1_x,
        pcb_support1_y,
        -pcb_bottom_layer_parts_height - pcb_thickness
        ])
    pcb_support();

    translate([
        pcb_support2_x,
        pcb_support2_y,
        -pcb_bottom_layer_parts_height - pcb_thickness
        ])
    pcb_support();
    
    // CAN connector side
    bottom_side_can();

    //  USB connector side
    bottom_side_usb();

    // Front side
    side_plane();

    // Back side
    translate([0, case_y - wall_thickness, 0])
    side_plane();
}

cantact();
case_bottom();
