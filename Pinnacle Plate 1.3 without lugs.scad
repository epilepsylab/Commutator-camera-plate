// template for night/day camera and commutator 

plate_size_x = 215;
plate_size_y = 95;
plate_thickness = 2;

comm_screw_diam = 5;
comm_plug_hole_size_x = 14;
comm_plug_hole_size_y = 32;
comm_plug_to_screw = 12.5;
comm_screw_distance = 90;

camera_screw_diam = 5;
camera_screw_distance_apart = 49;
camera_plug_hole_x = 9;
camera_plug_hole_y = 16.5;

dist_comm_screw_camera_screw = 35;

corner_screw_from_edge = 10;
corner_screw_diameter = 5;

lug_diameter = corner_screw_diameter + 6;
lug_height = 3.25;

translate_z = -(plate_thickness+1)/2;

// holes for commutator
difference() {
    union() {
        // plate
        cube([plate_size_x, plate_size_y, plate_thickness], center = true);
        // corner lugs
        // translate([plate_size_x/2-corner_screw_from_edge,plate_size_y/2-corner_screw_from_edge, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // translate([-(plate_size_x/2-corner_screw_from_edge-3),plate_size_y/2-corner_screw_from_edge, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // translate([plate_size_x/2-corner_screw_from_edge,-(plate_size_y/2-corner_screw_from_edge), 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // translate([-(plate_size_x/2-corner_screw_from_edge-3),-(plate_size_y/2-corner_screw_from_edge), 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // camera screw lugs
        // translate([dist_comm_screw_camera_screw, camera_screw_distance_apart/2, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // translate([dist_comm_screw_camera_screw+camera_screw_distance_apart, camera_screw_distance_apart/2, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // translate([dist_comm_screw_camera_screw, -camera_screw_distance_apart/2, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // translate([dist_comm_screw_camera_screw+camera_screw_distance_apart, -camera_screw_distance_apart/2, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
        // center lug
        // translate([-comm_screw_distance/2-4, 0, 0]) cylinder (h=plate_thickness/2+lug_height, d = lug_diameter);
    }
    union() {
        // commutator
        translate([-4,0,translate_z]) cylinder(h = plate_thickness+1, d = comm_screw_diam);
        translate([-comm_plug_to_screw-comm_plug_hole_size_x-2, -comm_plug_hole_size_y/2, translate_z]) cube([comm_plug_hole_size_x, comm_plug_hole_size_y, plate_thickness+1]);
        translate([-(comm_screw_distance+4),0,translate_z]) cylinder(h = plate_thickness+1, d = comm_screw_diam);
        // camera screw holes
        translate([dist_comm_screw_camera_screw, camera_screw_distance_apart/2, translate_z]) cylinder (h=plate_thickness+10, d = camera_screw_diam);
        translate([dist_comm_screw_camera_screw+camera_screw_distance_apart, camera_screw_distance_apart/2, translate_z]) cylinder (h=plate_thickness+10, d = camera_screw_diam);
        translate([dist_comm_screw_camera_screw, -camera_screw_distance_apart/2, translate_z]) cylinder (h=plate_thickness+10, d = camera_screw_diam);
        translate([dist_comm_screw_camera_screw+camera_screw_distance_apart, -camera_screw_distance_apart/2, translate_z]) cylinder (h=plate_thickness+10, d = camera_screw_diam);
        // camera plug hole
        translate([(dist_comm_screw_camera_screw-(camera_plug_hole_x/2)), -(camera_plug_hole_y/2), translate_z]) cube([camera_plug_hole_x, camera_plug_hole_y, plate_thickness+1]); 
        // corner screw holes
        translate([plate_size_x/2-corner_screw_from_edge,plate_size_y/2-corner_screw_from_edge, translate_z]) cylinder (h=plate_thickness+10, d = corner_screw_diameter);
        translate([-(plate_size_x/2-corner_screw_from_edge)+3,plate_size_y/2-corner_screw_from_edge, translate_z]) cylinder (h=plate_thickness+10, d = corner_screw_diameter);
        translate([plate_size_x/2-corner_screw_from_edge,-(plate_size_y/2-corner_screw_from_edge), translate_z]) cylinder (h=plate_thickness+10, d = corner_screw_diameter);
        translate([-(plate_size_x/2-corner_screw_from_edge)+3,-(plate_size_y/2-corner_screw_from_edge), translate_z]) cylinder (h=plate_thickness+10, d = corner_screw_diameter);
    }
}

