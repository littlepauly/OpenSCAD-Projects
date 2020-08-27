  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

//Box
difference(){
	difference(){
		translate([0,0,1]){cube([40,45,41],center=true);}	
		translate([0,0,2.8]){cube([35.2,40.2,38],center=true);}
	}

	union(){

//LENS HOLDER

	translate([0,20,2.8]){rotate([90,0,0]){cylinder(h=10,r=13.05, center=true);}}


// Power input
	translate([-21,-13.7,1.6]){rotate([0,90,0]){cylinder(h=5,r=3.4,center=true);}}
	translate([-21,-13.7,1.6]){rotate([0,90,0]){cylinder(h=10,r=1.51,center=true);}}


// Screw Through Hole
translate([0,10,-15]){cylinder(h=10,r=2.1,center=true);}

	}
}

// PCB Holder

translate([0,-6.6,-15.25]){cube([35.2,4.5,2.5],center=true);}
translate([16.8,-6.6,0]){cube([1.6,4.5,28],center=true);}


