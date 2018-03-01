
include <../config.scad>;

module dsub9()
{
    body_x = 12.5;
    body_y = 30.5;
    body_z = 12.5;

    connector_x = 5;
    connector_y = 16;
    connector_z = 9;

    // Black plastic body
    color("black")
    cube([
        body_x - 0.5,
        body_y,
        body_z
        ]);

    color("lightgrey")
    {
        // Metal plate
        translate([body_x - 0.5, 0, 0])
        cube([
            0.5,
            body_y,
            body_z
            ]);

        // Left screw terminal
        translate([body_x, 2.5, body_z/2])
        rotate([0, 90, 0])
        cylinder(r=4.5/2, h=5, $fn=6);

        // Right screw terminal
        translate([body_x, body_y-2.5, body_z/2])
        rotate([0, 90, 0])
        cylinder(r=4.5/2, h=5, $fn=6);

        // 9-pin connector
        translate([
            body_x,
            body_y/2 - connector_y/2,
            body_z/2 - connector_z/2
            ])
        cube([
            connector_x,
            connector_y,
            connector_z
            ]);
    }
}

dsub9();
