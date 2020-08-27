$fn = 0; $fa = 0.1; $fs = .1;


difference(){
union(){
    //cube([24,41,5],center=true);
    translate([0,0,-16]){rotate([0,90,0]){cylinder(h=24,r=16,center=true);}}
    
    translate([0,0,-15]){cube([24,50,5],center=true);}
    
    
}
union(){
    translate([0,0,-16]){rotate([0,90,0]){cylinder(h=25,r=13,center=true);}}
    
//skrew mount holes    
translate([8.31,16.625,0]){cylinder(h=10,r=1.5,center=true);}
translate([8.31,-16.625,0]){cylinder(h=10,r=1.5,center=true);}
translate([-8.31,16.625,0]){cylinder(h=10,r=1.5,center=true);}
translate([-8.31,-16.625,0]){cylinder(h=10,r=1.5,center=true);}

// bracket holes
translate([8,21,-16.5]){cylinder(h=10,r=1.5,center=true);}
translate([8,-21,-16.5]){cylinder(h=10,r=1.5,center=true);}
translate([-8,21,-16.5]){cylinder(h=10,r=1.5,center=true);}
translate([-8,-21,-16.5]){cylinder(h=10,r=1.5,center=true);}

// halve
translate([0,0,-31]){cube([25,511,30],center=true);}
}
}