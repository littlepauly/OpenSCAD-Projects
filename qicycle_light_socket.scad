$fn = 0; $fa = 0.1; $fs = .1;

extension = 20;

dep1 = 24;
dep2 = 10;
dep3 = 11;
w1 = 15;
D1 = 58; // socket diameter
D2 = 46; // handlebar diameter
D3 = 62; // outer diameter
theta1 = 13.6; // handle bar angle
theta2 = 5.5; // shade angle
l1 = 19+extension; // outer casing length
l2 = 13+extension;

//hole radii;
r1 = 7.5;
r2 = 2;

// wall thickness
wt = 2;

// notch positions
np = 3.5;
nt = 2;
// starting point = 3 o'clock 60deg a part

// fudge factor to avoid intersection errors
ff = 0.5;

//translate([0,0,-dep1-D2/2]){rotate([theta1+90,0,0]){cylinder(h = 2*D1, r= D2/2, center=true);}}


union() {
    // Outer Ring
    translate([0,0,dep3+l1/2]){
    difference() {
        cylinder(h = l1, r = D3/2, center=true);
        union(){
            cylinder(h = l1 + ff, r = D3/2 - wt, center=true);
            translate([0,0,7+l1/2]){rotate(a= [-theta2,0,0]){cube([D3+10,D3+10,20], center =true);}}
            }
    }
}
    difference() {
        // Socket Ring
        difference() {
            cylinder(h = dep1, r = D1/2, center=true);
            translate([0,0,dep1/2]){cylinder(h = dep2 + ff, r = D1/2 - wt, center=true);}
            }
        union() {
            // squared off sections
            translate([D1/2+w1/2,0,-(dep1-dep2)/2]){cube([D1,D1,dep1-dep2], center=true);}
            translate([-D1/2-w1/2,0,-(dep1-dep2)/2]){cube([D1,D1,dep1-dep2], center=true);}
            // rounded section for mounting to steering column
            translate([0,-D2/2,-(dep2+dep3)/2-D2/2]){rotate(a= [theta1+90,0,0]){cylinder(h = 3*D2, r= D2/2, center=true);}}
            // hole for wiring
            translate([+D1/4+r1/2,0,0]){cylinder(h = 100, r = r1, center=true);}
            
            // skrew holes
            cylinder(h = 100, r = r2, center = true);
            translate([0,r2/2,0]){cylinder(h = 100, r = r2, center = true);}
            translate([0,-r2/2,0]){cylinder(h = 100, r = r2, center = true);}
            
            translate([0,15,0]){cylinder(h = 100, r = r2, center = true);}
            translate([0,15+r2/2,0]){cylinder(h = 100, r = r2, center = true);}
            translate([0,15-r2/2,0]){cylinder(h = 100, r = r2, center = true);}
            
            // make parallel walls
            translate([0,-1,7]){rotate(a= [theta1,0,0]){cylinder(h = 10, r = 2*r2, center = true);}}
            translate([0,15-1,10]){rotate(a= [theta1,0,0]){cylinder(h = 10, r = 2*r2, center = true);}}
            
            }
        
    }
}