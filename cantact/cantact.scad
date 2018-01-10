
include <../config.scad>;
use <pcb.scad>;
use <usb.scad>;
use <dsub.scad>;

module cantact()
{
    cantact_x = 61;
    cantact_y = 36;
    
    hole1_x = 25.5;
    hole1_y = 4;
    
    hole2_x = 57.5;
    hole2_y = 28;
    
    difference()
    {
        // Generic PCB
        pcb(cantact_x, cantact_y);

        // First PCB hole
        translate([hole1_x, hole1_y, 0])
        cylinder(h=3, r=1.5, center=true);

        // Second PCB hole
        translate([hole2_x, hole2_y, 0])
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
