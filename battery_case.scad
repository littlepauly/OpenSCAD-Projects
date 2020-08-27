use <functions.scad>

//fudge factor
ff = 0.5;

length = 275;
width = 160;
depth = 50;
cor_rad = 4;

//18650 dimensions + 5%
bat_rad = 1.05*9.2;
bat_h = 1.05*65;

// target edge thickness 
et = 52;


difference() {

// Base
difference() {
    rect_round(length,width,depth,cor_rad);
    translate([0,0,depth-cor_rad*3]) {
        cube([length + ff, width + ff, depth + ff], center = true);
    }
}



// Battery locations - 4 sets of 8 and 2 sets of 4

// BLOCK ONE

// cent
p1x = length/2 - 4*bat_rad - et;
p1y = width/4;
p1z = bat_rad;

// Carve out battery volume
union () {
    // Carve out a rectangle about the battery volume but leave some of the curvature
    overshoot = 12.5;   
    
    translate([p1x, p1y, p1z-bat_rad]) {
        cube([6*bat_rad + overshoot, bat_h, 2*bat_rad + overshoot], center = true);
        }

for ( i = [1:4] ) {
    for ( j = [1:2] ) {
        translate([p1x-(i-3)*(2*bat_rad)-bat_rad, p1y, p1z-(j-1)*(2*bat_rad)]) {
            rotate( a = 90, v = [1,0,0] ) {
                cylinder(h = bat_h, r = bat_rad,  center = true);
            }
        }
    }
}
}

// BLOCK TWO

// cent
p2x = length/2 - 4*bat_rad - et;
p2y = -width/4;
p2z = bat_rad;

// Carve out battery volume
union () {
    // Carve out a rectangle about the battery volume but leave some of the curvature
    overshoot = 12.5;   
    
    translate([p2x, p2y, p2z-bat_rad]) {
        cube([6*bat_rad + overshoot, bat_h, 2*bat_rad + overshoot], center = true);
        }

for ( i = [1:4] ) {
    for ( j = [1:2] ) {
        translate([p2x-(i-3)*(2*bat_rad)-bat_rad, p2y, p2z-(j-1)*(2*bat_rad)]) {
            rotate( a = 90, v = [1,0,0] ) {
                cylinder(h = bat_h, r = bat_rad,  center = true);
            }
        }
    }
}
}

// BLOCK THREE

// cent
p3x = length/2 - 4*bat_rad - et - 87;
p3y = -width/4;
p3z = bat_rad;

// Carve out battery volume
union () {
    // Carve out a rectangle about the battery volume but leave some of the curvature
    overshoot = 12.5;   
    
    translate([p3x, p3y, p3z-bat_rad]) {
        cube([6*bat_rad + overshoot, bat_h, 2*bat_rad + overshoot], center = true);
        }

for ( i = [1:4] ) {
    for ( j = [1:2] ) {
        translate([p3x-(i-3)*(2*bat_rad)-bat_rad, p3y, p3z-(j-1)*(2*bat_rad)]) {
            rotate( a = 90, v = [1,0,0] ) {
                cylinder(h = bat_h, r = bat_rad,  center = true);
            }
        }
    }
}
}

// BLOCK FOUR

// cent
p4x = length/2 - 4*bat_rad - et - 87;
p4y = width/4;
p4z = bat_rad;

// Carve out battery volume
union () {
    // Carve out a rectangle about the battery volume but leave some of the curvature
    overshoot = 12.5;   
    
    translate([p4x, p4y, p4z-bat_rad]) {
        cube([6*bat_rad + overshoot, bat_h, 2*bat_rad + overshoot], center = true);
        }

for ( i = [1:4] ) {
    for ( j = [1:2] ) {
        translate([p4x-(i-3)*(2*bat_rad)-bat_rad, p4y, p4z-(j-1)*(2*bat_rad)]) {
            rotate( a = 90, v = [1,0,0] ) {
                cylinder(h = bat_h, r = bat_rad,  center = true);
            }
        }
    }
}
}

// BLOCK FIVE

// cent
p5x = length/2 - 4*bat_rad - et - 174;
p5y = width/4;
p5z = bat_rad;

// Carve out battery volume
union () {
    // Carve out a rectangle about the battery volume but leave some of the curvature
    overshoot = 12.5;   
    
    translate([p5x+2*bat_rad, p5y, p5z-bat_rad]) {
        cube([(6*bat_rad + overshoot)/2, bat_h, 2*bat_rad + overshoot], center = true);
        }

for ( i = [1:2] ) {
    for ( j = [1:2] ) {
        translate([p5x-(i-3)*(2*bat_rad)-bat_rad, p5y, p5z-(j-1)*(2*bat_rad)]) {
            rotate( a = 90, v = [1,0,0] ) {
                cylinder(h = bat_h, r = bat_rad,  center = true);
            }
        }
    }
}
}

// BLOCK SIX

// cent
p6x = length/2 - 4*bat_rad - et - 174;
p6y = -width/4;
p6z = bat_rad;

// Carve out battery volume
union () {
    // Carve out a rectangle about the battery volume but leave some of the curvature
    overshoot = 12.5;   
    
    translate([p6x+2*bat_rad, p6y, p6z-bat_rad]) {
        cube([(6*bat_rad + overshoot)/2, bat_h, 2*bat_rad + overshoot], center = true);
        }

for ( i = [1:2] ) {
    for ( j = [1:2] ) {
        translate([p6x-(i-3)*(2*bat_rad)-bat_rad, p6y, p6z-(j-1)*(2*bat_rad)]) {
            rotate( a = 90, v = [1,0,0] ) {
                cylinder(h = bat_h, r = bat_rad,  center = true);
            }
        }
    }
}

// Cable and BMS Void

vl = 35;
vw = width - 15;
vd = depth - 15;

translate([112,0,0]) {
cube([vl, vw, vd], center = true);
}

// Screw and mounting holes

// Mounting holes
mhd = 5.5; // hole diameter
mhl = 100; // hole length
mhyp = 70; // y pos
mhzp = 0;

//
mhxp1 = 90; // x pos void end
for ( i = [-1,1]) {
    translate([mhxp1, i*mhyp, mhzp]) {
        cylinder(h = mhl, r = mhd/2, center = true);        
        }
    }
    
mhxp2 = -83.5; // x pos void end
for ( i = [-1,1]) {
    translate([mhxp2, i*mhyp, mhzp]) {
        cylinder(h = mhl, r = mhd/2, center = true);        
        }
    }
    
// Case Holes
chd = 3.1; // hole diameter
chcr = 3; // counter sink radius
chcd = 2; // counter sink depth
chl = 100; // hole length
chyp = 76; // y pos
chzp = 0; 

for ( i = [-1,0,1]) {
for ( j = [ -132, 3, 133]) {
   translate([j,i*chyp,0]){
      union() {
      cylinder(h = chl, r = chd/2, center = true);
      translate([0,0,depth/2]) {
         cylinder(h = 2*chcd, r = chcr, center = true);
      }
      translate([0,0,-depth/2]) {
         cylinder(h = 2*chcd, r = chcr, center = true);
      }
}
}
}
}
}
}

// TO DO
// Add wire feed holes
// Add socket holes














