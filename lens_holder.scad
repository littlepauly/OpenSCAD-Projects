  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

//Iron

difference(){

	union(){
		translate([0,0,0]){
			cylinder(h=8,r=13, center=true);
		}

	}

	union(){

		translate([0,0,0]){
			cylinder(h=40,r=6.1, center=true);
		}
		translate([0,0,0]){
			rotate([00,90,00]){
				cylinder(h=100,r=1.9, center=true);
			}
		}
		translate([19.5,0,0]){
			cube(size= 15, center=true);
		}
		translate([-19.5,0,0]){
			cube(size= 15, center=true);
		}
	}
}