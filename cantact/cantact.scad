
include <../config.scad>;
use <pcb.scad>;
use <usb.scad>;
use <dsub.scad>;
use <led.scad>;
use <qfp.scad>;

module cantact_pcb()
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
}

module cantact()
{
    //cantact_pcb();

    color("green")
    rotate([0, 0, 90])
    translate([
        -124.3,
        90.8,
        0
        ])
    import("cantact.stl");

    // USB connector
    translate([45, 3.5, 0])
    usb_a();
    
    // D-Sub connector
    translate([10.5, 3, 0])
    mirror()
    dsub9();

    // LEDs
    color("lightgreen")
    translate([led1_x, led1_y, 0])
    smd_led();

    color("red")
    translate([led2_x, led2_y, 0])
    smd_led();

    // Microcontroller
    translate([mcu_x, mcu_y, 0])
    lqfp48();
}

cantact();
