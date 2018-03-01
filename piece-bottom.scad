
include <config.scad>
use <cantact/cantact.scad>;
use <pcb-screw-terminal.scad>;
use <pcb-support.scad>;
use <bottom-side-can.scad>;
use <bottom-side-usb.scad>;

/**
 * The case's bottom piece
 */
module piece_bottom()
{
    // bottom plane
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
    #translate([
        case_offset_x,
        case_offset_y,
        case_offset_z
        ])
    cube([
        case_x,
        wall_thickness,
        case_z
        ]);

    // Back side
    translate([
        case_offset_x,
        case_offset_y  + case_y - wall_thickness,
        case_offset_z
        ])
    cube([
        case_x,
        wall_thickness,
        case_z
        ]);
}

cantact();
piece_bottom();
