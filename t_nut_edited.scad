

difference(){

import("E:/3D Printer Workspace/T-nut_M3_x1.stl", center=true);


// nut cutout
translate([0,-0.7,3]){
union(){
cube([4,3,6.5], center=true);
rotate([0,60,0]){cube([4,3,6.5], center=true);}
rotate([0,120,0]){cube([4,3,6.5], center=true);}
}
}
}