  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

difference(){
union(){
cube([38,38,2],center=true);

translate([0,0,2]){cube([35.2,35.2,2],center=true);}
}

translate([0,1.6,2]){cylinder(h=2.1,r=3.15,center=true);}
translate([0,1.6,0]){cylinder(h=2.1,r=4,center=true);}
}