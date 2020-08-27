$fn = 0; $fa = 0.1; $fs = .1;
 
leg_hole_rad = 1.5; // Holes for the rj45 socket
screw_rad = 1.5;

rec_len = 20.3/2; 
rec_wid = 6/2;
rec_dep = 2/2;

cyl_rad = rec_wid;

leg_spa = 11; // space b/w legs

difference(){
union(){
   
   cube([rec_len*2,rec_wid*2,rec_dep*2],center = true);

   translate([rec_len,0,0]){cylinder(h=rec_dep*2,r=cyl_rad,center=true);}

   translate([-rec_len,0,0]){cylinder(h=rec_dep*2,r=cyl_rad,center=true);}

};
union(){
   translate([rec_len,0,0]){cylinder(h=rec_dep*3,r=screw_rad,center=true);}
   translate([-rec_len,0,0]){cylinder(h=rec_dep*3,r=screw_rad,center=true);}

   translate([leg_spa/2,0,0]){cylinder(h=rec_dep*3,r=leg_hole_rad,center=true);}
   translate([-leg_spa/2,0,0]){cylinder(h=rec_dep*3,r=leg_hole_rad,center=true);}


   
};

};