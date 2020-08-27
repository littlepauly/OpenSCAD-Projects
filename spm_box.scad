  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

//Box
difference(){
	difference(){
		cube([38,38,38],center=true);	
		translate([0,0,2.8]){cube([35.2,35.2,38],center=true);}
	}

	union(){

//LENS HOLDER

	translate([0,20,0]){rotate([90,0,0]){cylinder(h=10,r=13.05, center=true);}}

	translate([-21,-11.2,0]){rotate([0,90,0]){cylinder(h=5,r=3.4,center=true);}}
	translate([-21,-11.2,0]){rotate([0,90,0]){cylinder(h=10,r=1.51,center=true);}}


	}
}

translate([0,-4.1,-15.25]){cube([35.2,4.9,2.5],center=true);}
translate([16.8,-4.1,0]){cube([1.6,4.9,28],center=true);}

