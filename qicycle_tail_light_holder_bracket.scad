use <functions.scad>

$fa=.25; // default minimum facet angle is now 0.5
$fs=.25; // default minimum facet size is now 0.5 mm


post_rad = 17;
post_flange = 8;
cor_rad = 1.5;
thickness = 10;

screw_rad = 1.6;

lig_rad = 30;
soc_rad = 6.5;

arm_len = 120;

difference(){
union(){
// Post Bracket
// ring
rotate([0,0,5]){
ring_arc( post_rad, 170, cor_rad, thickness);
}
// wings
for(i=[0:1]) {
translate([ cos(180*i)*(post_rad+0.5*post_flange), cor_rad,0]) {
rect_round( post_flange, 2*cor_rad, thickness, cor_rad);
}
}
}
// screw holes
for(i=[0:1]) {
translate([ cos(180*i)*(post_rad+0.5*post_flange), cor_rad,0] ) {
rotate([ 90, 0, 0]){
cylinder(r = screw_rad, h=10, center=true);
}
}
}

}
