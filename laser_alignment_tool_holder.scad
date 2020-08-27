  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

small_skrew_rad = 1.4;


difference(){
union(){
cylinder(h=20,r=2.5,center=true);
translate([0,0,10.5]){cylinder(h=1,r=5, center=true);}
translate([0,10,21]){cube([15,30,20], center=true);}
}
translate([0,17,20]){cylinder(h=50,r=6,center=true);}
translate([5,17,11.25]){rotate([0,90,0]){cylinder(h=10,r=small_skrew_rad,center=true);}}
translate([0,0,-5.1]){cylinder(h=10,r=small_skrew_rad,center=true);}
}