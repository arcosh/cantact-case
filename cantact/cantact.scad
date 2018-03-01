
include <../config.scad>;
use <pcb.scad>;
use <usb.scad>;
use <dsub.scad>;

module cantact()
{
    difference()
    {
        // Generic PCB
        pcb(pcb_x, pcb_y);

        // First PCB hole
        translate([pcb_hole1_x, pcb_hole1_y, 0])
        cylinder(h=3, r=1.5, center=true);

        // Second PCB hole
        translate([pcb_hole2_x, pcb_hole2_y, 0])
        cylinder(h=3, r=1.5, center=true);
    }

    // USB connector
    translate([45, 3.5, 0])
    usb_a();
    
    // D-Sub connector
    translate([10.5, 3, 0])
    mirror()
    dsub9();
}

cantact();
