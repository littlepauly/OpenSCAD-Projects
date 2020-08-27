  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm
 
irad = 13;
thickness = 3;
orad = irad+thickness;
hwidth = 25;

shole = 1.5;


difference(){
    
    union(){
        cylinder(h=hwidth, r=orad, center=true);
        cube([orad*2+12,10,hwidth], center=true);
        translate([0,orad,0]){cube([*4+2,2*thickness,hwidth], center=true);}

    }
    
    union(){
        cylinder(h=hwidth+1, r=irad, center=true);
        cube([orad*2+12+1,2,hwidth+1], center=true);
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(orad+3),0,j*8]){rotate([90,0,0]){cylinder(h=12,r=shole,center=true);}}
            }
        }
    }
    for(i=[-1,1]){
        translate([i*(orad),orad-1.5,0]){cube([0,3.1,hwidth+1],center=true);}
        for(j=[-1,1]){
            translate([i*(orad+10),orad,j*8]){rotate([90,0,0]){cylinder(h=12,r=shole,center=true);}}
        }
    }

}