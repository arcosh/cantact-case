
include <config.scad>
use <cantact/cantact.scad>;

module screw_terminal()
{
    /*
     * Move slightly below zero to ensure
     * physical connection to bottom plane
     */
    translate([0, 0, -nothing])
    difference()
    {
        cylinder(
            r = screw_terminal_outer_diameter/2,
            h = pcb_bottom_layer_parts_height + expansion_z/2 + nothing
            );
        
        // Make a hole for the screw
        cylinder(
            r = screw_terminal_inner_diameter/2,
            h = pcb_bottom_layer_parts_height + expansion_z/2 + 2*nothing
            );
    }
}

module piece_bottom()
{
    // bottom plane
    translate([
        -expansion_x/2 - wall_thickness,
        -expansion_y/2 - wall_thickness,
        -wall_thickness - pcb_thickness - expansion_z/2 - pcb_bottom_layer_parts_height
        ])
    cube([
        pcb_x + expansion_x + 2*wall_thickness,
        pcb_y + expansion_y + 2*wall_thickness,
        wall_thickness
        ]);

    // Screw terminals
    translate([
        pcb_hole1_x,
        pcb_hole1_y,
        -pcb_bottom_layer_parts_height - pcb_thickness - nothing
        ])
    screw_terminal();

    translate([
        pcb_hole2_x,
        pcb_hole2_y,
        -pcb_bottom_layer_parts_height - pcb_thickness - nothing
        ])
    screw_terminal();
    
    // PCB supports
    
    // CAN connector side
    
    //  USB connector side
    
}

cantact();
piece_bottom();
