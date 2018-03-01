
$fn = 200;
nothing = 0.01;

/*
 * CANtact PCB properties
 */
pcb_x = 61;
pcb_y = 36;
pcb_thickness = 1;
pcb_bottom_layer_parts_height = 3;
pcb_top_layer_parts_height = 12;

pcb_hole1_x = 25.5;
pcb_hole1_y = 4;

pcb_hole2_x = 57.5;
pcb_hole2_y = 28;

/*
 * Case properties
 */
wall_thickness = 1.5;
pcb_screw_terminal_outer_diameter = 4.5;
pcb_screw_terminal_inner_diameter = 1.5;
pcb_support_diameter = 3;

pcb_support1_x = 15.5;
pcb_support1_y = pcb_hole2_y - 1;

pcb_support2_x = 54;
pcb_support2_y = 8;

dsub_cutout_y = 30.5 + 1;
dsub_cutout_z = 12.5 + 1;
dsub_cutout_offset_y = 3 - 0.5;
dsub_cutout_offset_z = -0.5;

/*
 * How much to increase x and y,
 * respectively width and length
 * compared to the PCB size
 */
expansion_x = 1;
expansion_y = 1;
expansion_z = 0;

/*
 * Derivative case measures
 */
 // True dimensions of the case (bottom piece + lid)
 case_x = pcb_x + expansion_x + 2*wall_thickness;
 case_y = pcb_y + expansion_y + 2*wall_thickness;
 case_z = pcb_thickness + pcb_top_layer_parts_height + pcb_bottom_layer_parts_height + expansion_z + 2*wall_thickness;
 
 // How much the origin of the case (i.e. bottom piece) model
 // is shifted compared to the PCB's origin
 case_offset_x = -expansion_x/2 - wall_thickness;
 case_offset_y = -expansion_y/2 - wall_thickness;
 case_offset_z = -wall_thickness - pcb_thickness - expansion_z/2 - pcb_bottom_layer_parts_height;
 