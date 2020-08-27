  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

//

difference(){

	union(){
		translate([0,0,0]){
			cylinder(h=8,r=31.5, center=true);
		}

	}

	union(){

		translate([0,0,0]){
			cylinder(h=40,r=4, center=true);
		}
		translate([0,0,6]){
			difference(){
				cylinder(h=10, r=30,center=true);
				union(){
					difference(){
							cylinder(h=10, r=18, center=true);
							cylinder(h=10, r=16, center=true);
					}
							
					translate([0,0,-5]){
						rotate([0,0,67.5]){
							cube([1,100,2], center=true);
						}
						rotate([0,0,22.5]){
							cube([1,100,2], center=true);
						}
						rotate([0,0,112.5]){
							cube([1,100,2], center=true);
						}
						rotate([0,0,157.5]){
							cube([1,100,2], center=true);
						}
					}
				}
			}
		}
		translate([0,0,-6]){
			difference(){
				cylinder(h=10, r=30,center=true);

			}
			rotate([0,0,0]){
				union(){
					translate([6,6,0]){
					cylinder(h=100,r=2, center=true);
					}
					translate([12,12,0]){	
						cylinder(h=100,r=2, center=true);
					}
					translate([-6,-6,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-12,-12,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-18,-18,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([18,18,0]){
						cylinder(h=100,r=2, center=true);
					}
				}
			}
			rotate([0,0,45]){
				union(){
					translate([6,6,0]){
					cylinder(h=100,r=2, center=true);
					}
					translate([12,12,0]){	
						cylinder(h=100,r=2, center=true);
					}
					translate([-6,-6,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-12,-12,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-18,-18,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([18,18,0]){
						cylinder(h=100,r=2, center=true);
					}
				}
			}
			rotate([0,0,90]){
				union(){
					translate([6,6,0]){
					cylinder(h=100,r=2, center=true);
					}
					translate([12,12,0]){	
						cylinder(h=100,r=2, center=true);
					}
					translate([-6,-6,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-12,-12,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-18,-18,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([18,18,0]){
						cylinder(h=100,r=2, center=true);
					}
				}
			}
			rotate([0,0,135]){
				union(){
					translate([6,6,0]){
					cylinder(h=100,r=2, center=true);
					}
					translate([12,12,0]){	
						cylinder(h=100,r=2, center=true);
					}
					translate([-6,-6,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-12,-12,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([-18,-18,0]){
						cylinder(h=100,r=2, center=true);
					}
					translate([18,18,0]){
						cylinder(h=100,r=2, center=true);
					}
				}
			}			

		}
	}
}
