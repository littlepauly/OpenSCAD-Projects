  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

union(){
	// Cylinder w/ holes
	difference(){
	cylinder(h=2,r=31.5,center=true);
	
	for(i=[0:7]){
	rotate([0,0,-45*i]){
	// Hole Unit Cell
	union(){
		translate([0,0,0]){cylinder(h=10,r=2,center=true);}
		translate([-3,13,0]){cylinder(h=10,r=2,center=true);}
		translate([-3,20,0]){cylinder(h=5,r=2,center=true);}
		translate([-3,27.5,0]){cylinder(h=5,r=2,center=true);}
		translate([3,13,0]){cylinder(h=5,r=2,center=true);}
		translate([3,20,0]){cylinder(h=5,r=2,center=true);}
		translate([3,27.5,0]){cylinder(h=5,r=2,center=true);}
		rotate([0,0,-22.5]){ 
			translate([0,8,0]){cylinder(h=5,r=2,center=true);}	
			translate([0,17,0]){cylinder(h=5,r=2,center=true);}
			translate([0,23,0]){cylinder(h=5,r=2,center=true);}
			translate([0,28,0]){cylinder(h=5,r=2,center=true);}
		}
	}
	}
	}
	}
	
	// Braces
	for(j=[0:7]){
	rotate([0,0,45*j]){translate([-1,4,1]){cube([2,26,2]);}}
	}

	// Outer Ring
	difference(){
	translate([0,0,2]){cylinder(h=5,r=31.5,center=true);}
	cylinder(h=10,r=30,center=true);
	}
}