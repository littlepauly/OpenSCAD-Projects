$fn = 0; $fa = 0.1; $fs = .1;

// Tail Light IO Hub

r_o = 31; // outer radius
r_i = 59/2; // socket radius
l_o = 30;
l_i = 15;

clip_angle = 67.8; // there are four clips in two pairs 180deg a part this is the angle between the clips in the pair

clip_offset = 3;

clip_length = 11/2;
clip_depth = 1.5/2;
clip_width = 2.5/2;

slot_len = 14/2;


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

