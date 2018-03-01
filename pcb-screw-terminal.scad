
include <config.scad>;

/**
 * Cylinders with holes for screws to fix PCB to bottom piece
 */
module pcb_screw_terminal()
{
    /*
     * Move slightly below zero to ensure
     * physical connection to bottom plane
     */
    translate([0, 0, -nothing])
    difference()
    {
        cylinder(
            r = pcb_screw_terminal_outer_diameter/2,
            h = pcb_bottom_layer_parts_height + expansion_z/2 + nothing
            );
        
        // Make a hole for the screw
        cylinder(
            r = pcb_screw_terminal_inner_diameter/2,
            h = pcb_bottom_layer_parts_height + expansion_z/2 + 2*nothing
            );
    }
}

pcb_screw_terminal();
