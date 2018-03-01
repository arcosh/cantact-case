
include <../config.scad>;

module smd_led()
{
    translate([
        -led_size_x/2,
        -led_size_y/2,
        0
        ])
    cube([
        led_size_x,
        led_size_y,
        led_size_z
        ]);
}

smd_led();
