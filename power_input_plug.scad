$fn = 0; $fa = 0.1; $fs = .1;

rad = 62.5/2;

sckt_rad = 17.5/2;
sckt_dep = 5;

sm_sckt_rad = 11.5/2;

intersection(){

translate([ 0, 0, rad - 0.5*sckt_dep]){rotate([ 0, 90, 0]){cylinder( h=rad, r=rad, center=true);}}

union(){

   // outer portion
   cylinder( h=sckt_dep, r=sckt_rad, center=true);

   // inner portion
   
translate([ 0, 0, sckt_dep]){
   difference(){
      cylinder( h=sckt_dep, r=sm_sckt_rad, center=true);
      translate([ sckt_rad, 0, 0]){cube([ sckt_rad, sckt_rad, 1.01*sckt_dep], center=true);}
}
}
}
}