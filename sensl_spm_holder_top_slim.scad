  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm


rad = 1.35;

difference(){
union(){
cube([48,52,2],center=true);
// original cube([44,48,2],center=true);

translate([12.5,9.75,3]){cylinder(h=7,r=rad+1.1,center=true);}
translate([-12.5,9.75,3]){cylinder(h=7,r=rad+1.1,center=true);}

translate([15,-19.5,3]){cylinder(h=7,r=rad+1.1,center=true);}
translate([-15,-19.5,3]){cylinder(h=7,r=rad+1.1,center=true);}

// hold fibre coupler
translate([0,-3,2]){cube([8,2,2], center=true);}
translate([0,-13,2]){cube([8,2,2], center=true);}

translate([0,0,10]){
difference(){
translate([0,0,-6.5]){cube([48,52,7],center=true);}

translate([0,0,-13]){
union(){
translate([0,0,0]){cube([42,46,20],center=true);}

translate([21,-8.6,8.2]){cube([9.5,9.5,7.9],center=true);}
translate([-21,-8.6,8.2]){cube([9.5,9.5,7.9],center=true);}
translate([0,24,8.2]){cube([9.5,9.5,7.9],center=true);}
}
}
}
}
}

translate([0,0,7]){cube([44,48,4],center=true);}

// holes
translate([12.5,9.75,10]){cylinder(h=25,r=rad+.25,center=true);}
translate([-12.5,9.75,10]){cylinder(h=25,r=rad+.25,center=true);}

translate([15,-19.5,10]){cylinder(h=25,r=rad+.25,center=true);}
translate([-15,-19.5,10]){cylinder(h=25,r=rad+.25,center=true);}

// mounting holes
//translate([4.5,-61.25,0]){cylinder(h=25,r=1.25,center=true);}
//translate([4.5,61.25,0]){cylinder(h=25,r=1.25,center=true);}

// fibre mounting hole
translate([0,-8,10]){cylinder(h=25,r=3.2,center=true);}



}
