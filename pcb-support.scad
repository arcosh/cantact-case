
include <config.scad>;

/**
 * Tiny stilts to prevent the PCB from dangling around
 */
module pcb_support()
{
    /*
     * Move slightly below zero to ensure
     * physical connection to bottom plane
     */
    translate([0, 0, -nothing])
    cylinder(
        r = pcb_support_diameter/2,
        h = pcb_bottom_layer_parts_height + expansion_z/2 + 2*nothing
        );
}

pcb_support();
