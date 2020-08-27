  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

// Phone Dimensions 0.5mm slack 
p_len = 142.5;
p_wid = 73.5;
p_dep = 8.5;

arm_thick_x = 7.5; // The thickness of the arms
arm_thick_y = 5;
arm_radius = 9;

bracket_wid = 25;
bracket_hole_spacing = 52;
bracket_hole_rad = 1.5;

// The Long Arms

difference(){
union(){
cube([arm_thick_y, p_wid, arm_thick_x], center=true);
rotate([90,0,90]){translate([p_wid/2,arm_radius-arm_thick_x/2,0]){cylinder(h=arm_thick_y, r=arm_radius, center=true);}}
rotate([90,0,90]){translate([-p_wid/2,arm_radius-arm_thick_x/2,0]){cylinder(h=arm_thick_y, r=arm_radius, center=true);}}
}

union(){
    // phone space
translate([0,0,arm_thick_x]){cube([arm_thick_y+0.1, p_wid, arm_thick_x], center=true);}
    // overhang space
translate([0,0,2*arm_thick_x]){cube([arm_thick_y+0.1, p_wid-4, arm_thick_x+0.1], center=true);}
    // Cuttout for bracket
translate([0,0,-arm_thick_x+1]){cube([arm_thick_y+0.1, bracket_wid, arm_thick_x+0.1], center=true);}
    // the holes
//rotate([0,0,0]){translate([0,bracket_hole_spacing/2,0]){cylinder(h=30, r=bracket_hole_rad, center=true);}}
//rotate([0,0,0]){translate([0,-bracket_hole_spacing/2,0]){cylinder(h=30, r=bracket_hole_rad, center=true);}}
    // notchs for the long arm
translate([0,8,arm_thick_x/2]){cube([10, arm_thick_y+0.1, arm_thick_x+0.1], center=true);}
translate([0,-8,arm_thick_x/2]){cube([10, arm_thick_y+0.1, arm_thick_x+0.1], center=true);}
}
}