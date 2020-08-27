  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm


rad = 1.35;

difference(){
union(){
cube([44,48,2],center=true);

translate([0,9.75,0]){
union(){
translate([12.5,6.25,2.9]){cylinder(h=3.8,r=3.5,center=true);}
translate([-12.5,6.25,2.9]){cylinder(h=3.8,r=3.5,center=true);}
translate([12.5,-6.25,2.9]){cylinder(h=3.8,r=3.5,center=true);}
translate([-12.5,-6.25,2.9]){cylinder(h=3.8,r=3.5,center=true);}

translate([12.5,0,2.9]){cube([7,12.5,3.8],center=true);}
translate([-12.5,0,2.9]){cube([7,12.5,3.8],center=true);}
}}

translate([0,0,2.9]){
difference(){
cube([44,48,3.8],center=true);
union(){
translate([0,3.5,0]){cube([40,37,3.83],center=true);}
translate([21,-8.6,0]){cube([9.5,9.5,3.83],center=true);}
translate([-21,-8.6,0]){cube([9.5,9.5,3.83],center=true);}
translate([0,24,0]){cube([9.5,9.5,3.83],center=true);}
}
}}

}
// holes


translate([12.5,3.5,3]){cylinder(h=4,r=rad,center=true);}
translate([12.5,16,3]){cylinder(h=4,r=rad,center=true);}
translate([12.5,9.75,3]){cylinder(h=4,r=rad,center=true);}

translate([-12.5,3.5,3]){cylinder(h=4,r=rad,center=true);}
translate([-12.5,16,3]){cylinder(h=4,r=rad,center=true);}
translate([-12.5,9.75,3]){cylinder(h=4,r=rad,center=true);}

translate([15,-19.5,3]){cylinder(h=4,r=rad,center=true);}
translate([-15,-19.5,3]){cylinder(h=4,r=rad,center=true);}

}
