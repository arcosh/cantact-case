
include <../config.scad>;

color_pcb_material="yellow";
color_pcb_soldermask="green";

module pcb(x, y, z=pcb_thickness)
{
    soldermask_z = z/10;

    // Green solder mask on top and bottom layer
    color(color_pcb_soldermask)
    translate([nothing, nothing, -z])
    cube([
        x - 2*nothing,
        y - 2*nothing,
        z
        ]);

    // Yellowish PCB material (FR4)
    color(color_pcb_material)
    translate([0, 0, soldermask_z - z])
    cube([
        x,
        y,
        z - 2*soldermask_z
        ]);
}

pcb(20, 10);
