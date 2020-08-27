  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

//Iron

difference(){

	union(){
		translate([0,0,0]){
			cylinder(h=25,r=9.5, center=true);
		}
		translate([0,0,13.75]){
			cylinder(h=3,r1=9.5, r2=6.8, center=true);
		}
	}

	union(){
		translate([0,0,-10]){
			cylinder(h=8.5,r=2.5 ,center=true);
		}
		translate([0,0,14]){
			cylinder(h=40,r=4.1, center=true);
		}
		translate([5,0,6]){
			rotate([00,90,00]){
				cylinder(h=10,r=2.5, center=true);
			}
		}
	}
}