$fn = 0; $fa = 0.1; $fs = .1; $center=true;

// Tail Light IO Hub

r_o = 31; // outer radius
r_i = 59/2; // socket radius
l_o = 25; // outer len
l_i = 12.5; // inner len

// Clips

clip_angle = 67.8; // there are four clips in two pairs 180deg a part this is the angle between the clips in the pair

clip_offset = 3;

clip_length = 11/2;
clip_depth = 1.5/2;
clip_width = 2.5/2;

slot_len = 14/2;

// Switch

sw_len = 31.5;
sw_wid =  22;
sw_dep = 18;

// Light Socket

li_len = 15.5;
li_wid = 13;
li_dep = 18;

// XT60 Socket

xt_len = 16;
xt_wid = 8.5;
xt_dep = 15;

// Charging Port

ch_rad = 6;
ch_dep =15;

difference() {

// Hub Body

difference() {   

   // OUTSIDE CASE
   union() {
      cylinder(h = l_o, r = r_o, center = true);
      translate([0, 0, (l_o+l_i)/2]) {cylinder(h = l_i, r = r_i, center = true);}
   }
   
   // INNER VOLUME
   union() {
      translate([0, 0, (l_o+l_i)/4]) {cylinder(h = l_i + l_o, r = r_i - 3, center = true);}


   // SLOTS
   for(i=[0:1]){
      for(j=[0:1]){
            
         rotate([0, 0, 10.6 + i*clip_angle + j*180]){
            translate([r_i - clip_depth, 0, l_o/2 + clip_offset + clip_width]){
               cube([clip_depth*2, clip_length*2, clip_width*2],center = true);
            }
         }
         rotate([0, 0, 31.2 + i*clip_angle + j*180]){
            translate([r_i - clip_depth, 0, l_o/2 + slot_len + clip_offset]){
               cube([clip_depth*2, clip_length*2, slot_len*2],center = true);
            }
         }

      }
   }
   }  
}

// Cutouts

// Switch

translate([0,10,-10]){cube([sw_len,sw_wid,sw_dep], center=true);}

// Light Plug RJ

rotate([0,0,50]){translate([0,-18,-10]){cube([li_len,li_wid,li_dep], center=true);}}

// XT60

rotate([0,0,0]){translate([-3,-20,-10]){cube([xt_len,xt_wid,xt_dep], center=true);}}

// Charging Port

translate([-17,-9,-10]){
   difference(){
      cylinder(h = ch_dep, r =ch_rad, center=true);
      translate([0,11,0]){cube([ch_rad*2,ch_rad*2,ch_dep+1], center=true);}
   }
}


}










