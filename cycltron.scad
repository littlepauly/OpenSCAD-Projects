  $fa=0.5; // default minimum facet angle is now 0.5
  $fs=0.5; // default minimum facet size is now 0.5 mm

//Iron

translate([0,0,-15]){
	cylinder(h=20,r=60, center=true);
}
translate([0,0,15]){
	cylinder(h=20,r=60, center=true);
}

translate([0,0,35]){
	cube(size=[200,40,20],center=true);
}

translate([0,0,-35]){
	cube(size=[200,40,20],center=true);
}

translate([90,0,0]){
	cube(size=[20,40,50],center=true);
}

translate([-90,0,0]){
	cube(size=[20,40,50],center=true);
}

//Solenoid

translate([0,0,-19]){
	color([0.1,0.5,0.2]) cylinder(h=12,r=70, center=true);
}
translate([0,0,19]){
	color([0.1,0.5,0.2]) cylinder(h=12,r=70, center=true);
}