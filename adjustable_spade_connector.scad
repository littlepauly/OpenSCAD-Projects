$fn = 0; $fa = 0.1; $fs = .1;

// PARAMETERS //

// Spade Dimensions

sp_wid = 6.5;
sp_th  = 1;
sp_hi  = 9;

// Wire Dimensions

wr_rad = 1/2; // Unshielded radius
wr_sh  = 2/2; // Shielded radius

// Connector Envelope

cn_wid = 4*wr_sh  + sp_wid;
cn_hi = 2*sp_hi;
cn_th = 1.5*sp_th + 2*wr_sh + 2*wr_rad;

// Carving parameters

sh_rad = cn_wid/4; // Shoulder radius




// MODEL //

difference(){

// Connector Envelope
cube([ cn_wid, cn_th, cn_hi], center=true);

// Cut aways
union(){

   // Shoulders
   for(i=[0:1]){
   translate([ i*cn_wid - cn_wid/2, 0, sh_rad]){rotate([ 90, 0, 0]){cylinder( h=cn_th*1.1, r=sh_rad, center=true);}}
   }

   // Spade
   translate([ 0, 0, -0.5*cn_wid]){cube([ sp_wid, 1.25*sp_th, 1.1*sp_hi], center=true);}

   // Wire
   // Shielded
   translate([ 0, 0.5*wr_sh, .5*cn_hi,]){cylinder( h=cn_hi, r=wr_sh, center=true);}
   // Unshielded
   translate([ 0, wr_rad, -.125*cn_hi,]){cylinder( h=0.26*cn_hi, r=wr_rad, center=true);}

   // Through hole
   translate([ 0, 0, -0.25*cn_hi ]){rotate([ 90, 0, 0]){cylinder( h=1.1*cn_th, r=wr_sh, center=true);}}

   // Cabletie slot
   translate([ 0, -0.25*cn_th, sh_rad]){cube([ cn_wid, 0.51*cn_th, 1.5*sh_rad], center=true);}


}
}