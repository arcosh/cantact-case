
include <config.scad>;
use <part-bottom.scad>;
use <part-lid.scad>;

spacing = 3;

part_bottom();

translate([0, case_y + spacing, 0])
part_lid();
