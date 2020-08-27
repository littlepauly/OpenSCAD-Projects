$fn = 0; $fa = 0.1; $fs = .1;

length = 126;
width = 66.5;
depth = 9;
circle_rad = 7;

llength = length +6;
lwidth = width + 6;
ldepth = depth + 3;

union(){
difference(){
union(){
   
    // Body
cube([lwidth-circle_rad*2,llength-circle_rad*2,ldepth], center=true);
for(i=[0:1]){
for(j=[0:1]){
translate([lwidth/2-circle_rad-(lwidth-circle_rad*2)*i,llength/2-circle_rad-(llength-circle_rad*2)*j,0]){cylinder(h=ldepth,r=circle_rad,center=true);}
}
}

translate([(lwidth-circle_rad)/2,0,0]){cube([circle_rad,llength-2*circle_rad,ldepth],center=true);}
translate([(-lwidth+circle_rad)/2,0,0]){cube([circle_rad,llength-2*circle_rad,ldepth],center=true);}
translate([0,(llength-circle_rad)/2,0]){cube([lwidth-2*circle_rad,circle_rad,ldepth],center=true);}
translate([0,(-llength+circle_rad)/2,0]){cube([lwidth-2*circle_rad,circle_rad,ldepth],center=true);}

}
union(){
    // Phone cut out
translate([0,0,2]){union(){
cube([width+0.1-circle_rad*2,length+0.1-circle_rad*2,depth+0.1], center=true);
for(i=[0:1]){
for(j=[0:1]){
translate([width/2-circle_rad-(width-circle_rad*2)*i,length/2-circle_rad-(length-circle_rad*2)*j,0]){cylinder(h=depth,r=circle_rad,center=true);}
}
}

translate([(width-circle_rad)/2,0,0]){cube([circle_rad,length-2*circle_rad,depth],center=true);}
translate([(-width+circle_rad)/2,0,0]){cube([circle_rad,length-2*circle_rad,depth],center=true);}
translate([0,(length-circle_rad)/2,0]){cube([width-2*circle_rad,circle_rad,depth],center=true);}
translate([0,(-length+circle_rad)/2,0]){cube([width-2*circle_rad,circle_rad,depth],center=true);}

}
}

// Buttons
translate([lwidth/2,26,2]){cube([8,12,4],center=true);}
translate([-lwidth/2,23,2]){cube([8,24,4],center=true);}
//
translate([0,-66,1.25]){cube([15,10,5],center=true);}

for(i=[0:3]){
for(j=[0:7]){
translate([16.625*i-24.94,16.625*j-58,-7]){cylinder(h=10,r=5,center=true);}
}
}

for(i=[0:2]){
for(j=[0:6]){
translate([16.625*i-16.625,16.625*j-16.625*3,-7]){cylinder(h=10,r=5,center=true);}
}
}

//screw mount holes
translate([8.31,16.625,-7]){cylinder(h=10,r=1.5,center=true);}
translate([8.31,-16.625,-7]){cylinder(h=10,r=1.5,center=true);}
translate([-8.31,16.625,-7]){cylinder(h=10,r=1.5,center=true);}
translate([-8.31,-16.625,-7]){cylinder(h=10,r=1.5,center=true);}

}
}

// holding tabs
translate([-32.25,0,5.5]){cube([2,10,1],center=true);}
translate([32.25,0,5.5]){cube([2,10,1],center=true);}
translate([0,63,5.5]){cube([10,2,1],center=true);}
translate([0,-63,5.5]){cube([10,2,1],center=true);}
}