  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

small_skrew_rad = 1.4;

difference(){
union(){
translate([0,0,-6]){cylinder(h=18,r=16,center=true);}
translate([-12,-12,-6]){cylinder(h=18,r=10,center=true);}
translate([8,-8,-20]){rotate([0,0,45]){cube([10,7.5,15],center=true);}}
}
union(){
translate([0,0,5]){cylinder(h=30,r=13.75,center=true);}
cylinder(h=35,r=7.5,center=true);
translate([0,10,0]){cylinder(h=35,r=small_skrew_rad,center=true);}
translate([10,0,0]){cylinder(h=35,r=small_skrew_rad,center=true);}
rotate([0,90,0]){cylinder(h=35,r=small_skrew_rad,center=true);}
rotate([90,0,0]){cylinder(h=35,r=small_skrew_rad,center=true);}
translate([0,0,-8]){rotate([0,90,0]){cylinder(h=35,r=small_skrew_rad,center=true);}}
translate([0,0,-8]){rotate([90,0,0]){cylinder(h=35,r=small_skrew_rad,center=true);}}
translate([-12,-12,0]){cylinder(h=31,r=2.5,center=true);}
translate([8,-8,-24]){rotate([90,0,45]){cylinder(h=31,r=small_skrew_rad,center=true);}}
}
}