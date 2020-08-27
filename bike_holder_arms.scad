  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

// Phone Dimensions 0.5mm slack 
p_len = 142.5;
p_wid = 173.5;
p_dep = 8.5;

arm_thick_x = 7.5; // The thickness of the arms
arm_thick_y = 5;
arm_radius = 9;

bracket_len = 66;
bracket_hole_spacing = 52;
bracket_hole_rad = 1.5;
skrew_head = 5.5/2;

// The Long Arms

difference(){
union(){
cube([arm_thick_y, p_len, arm_thick_x], center=true);
rotate([90,0,90]){translate([p_len/2,arm_radius-arm_thick_x/2,0]){cylinder(h=arm_thick_y, r=arm_radius, center=true);}}
rotate([90,0,90]){translate([-p_len/2,arm_radius-arm_thick_x/2,0]){cylinder(h=arm_thick_y, r=arm_radius, center=true);}}
}

union(){
    // phone space
translate([0,0,arm_thick_x]){cube([arm_thick_y+0.1, p_len, arm_thick_x], center=true);}
    // overhang space
translate([0,2,2*arm_thick_x]){cube([arm_thick_y+0.1, p_len-8, arm_thick_x+0.1], center=true);}
    // Cuttout for bracket
translate([0,0,-arm_thick_x+1]){cube([arm_thick_y+0.1, bracket_len, arm_thick_x+0.1], center=true);}
    // the holes
rotate([0,0,0]){translate([0,bracket_hole_spacing/2,0]){cylinder(h=30, r=bracket_hole_rad, center=true);}}
rotate([0,0,0]){translate([0,-bracket_hole_spacing/2,0]){cylinder(h=30, r=bracket_hole_rad, center=true);}}
    // the holes -- skrew heads
rotate([0,0,0]){translate([0,bracket_hole_spacing/2,3]){cylinder(h=3, r=skrew_head, center=true);}}
rotate([0,0,0]){translate([0,-bracket_hole_spacing/2,3]){cylinder(h=3, r=skrew_head, center=true);}}
    // notch for the short arm
translate([0,0,-arm_thick_x/2]){cube([10, arm_thick_y+0.1, arm_thick_x+0.1], center=true);}
}
}
