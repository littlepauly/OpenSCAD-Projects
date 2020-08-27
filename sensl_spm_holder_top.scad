  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm


rad = 1.35;

difference(){
union(){
cube([48,52,2],center=true);
// original cube([44,48,2],center=true);

translate([12.5,9.75,10]){cylinder(h=20,r=rad+1.1,center=true);}
translate([-12.5,9.75,10]){cylinder(h=20,r=rad+1.1,center=true);}

translate([15,-19.5,10]){cylinder(h=20,r=rad+1.1,center=true);}
translate([-15,-19.5,10]){cylinder(h=20,r=rad+1.1,center=true);}

translate([0,0,10]){
difference(){
cube([48,52,20],center=true);

union(){
translate([0,0,0]){cube([42,46,20],center=true);}

translate([21,-8.6,8.2]){cube([9.5,9.5,7.9],center=true);}
translate([-21,-8.6,8.2]){cube([9.5,9.5,7.9],center=true);}
translate([0,24,8.2]){cube([9.5,9.5,7.9],center=true);}
}
}
}
}

translate([0,0,20]){cube([44,48,4],center=true);}

// holes
translate([12.5,9.75,10]){cylinder(h=25,r=rad+.25,center=true);}
translate([-12.5,9.75,10]){cylinder(h=25,r=rad+.25,center=true);}

translate([15,-19.5,10]){cylinder(h=25,r=rad+.25,center=true);}
translate([-15,-19.5,10]){cylinder(h=25,r=rad+.25,center=true);}

// mounting hole
translate([0,-19.5,10]){rotate([90,0,0]){cylinder(h=25,r=2,center=true);}}

// big hole
translate([0,-8,10]){cylinder(h=25,r=13,center=true);}



}
