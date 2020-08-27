  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

difference(){
union(){
cube([42,46,3],center=true);

translate([0,0,2]){cube([35.2,40.2,2],center=true);}
}

translate([2.3,4.1,2]){cylinder(h=2.1,r=3.3,center=true);}
translate([2.3,4.1,-1]){cylinder(h=4,r=6,center=true);}
}