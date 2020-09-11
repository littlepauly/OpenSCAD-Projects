$fn = 0; $fa = 0.1; $fs = .1;

// Dovetail tool


// Magnet Holes
mag_rad = 4;
mag_th  = 1;

// Dimensions
gd_wid_up = 40;
gd_wid_lw = 20;
gd_hght   = 60;
gd_dp_up  = 30;
gd_dp_lw  = 10;

difference(){
linear_extrude( height = gd_dp_up, center=true){ polygon( points = [ [0.5*gd_wid_up, 0.5*gd_hght], [0.5*gd_wid_lw, -0.5*gd_hght],
   [-0.5*gd_wid_lw, -0.5*gd_hght], [-0.5*gd_wid_up, 0.5*gd_hght] ] );}

union(){
translate([ 0, -(1/6)*gd_hght, gd_dp_lw]){ cube( [ (2/3)*gd_hght, 1.01*(2/3)*gd_hght, gd_dp_up], center=true);}

// Magnet Holes

for( i=[0:1]){
   for( j=[-1,1]){
      translate([ j*0.5*(gd_wid_up-gd_wid_up/12)-j*0.5*mag_th, (1/3)*gd_hght, i*0.5*gd_dp_up - 0.25*gd_dp_up]){
         rotate([ 0, 90, -j*9.462,]){
            cylinder( h=1.5*mag_th, r=1.02*mag_rad, center=true);
         }
      }
   }
}


}
}
