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
arm_wid = 7;

hol_wid = 68;
hol_len = 20;

difference(){
union(){

// Post Bracket
translate( [ 0, 0, 3.25]) {
rotate( [ -10, 0, 0]) {
difference(){
union(){

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

union(){
// screw holes
for(i=[0:1]) {
translate([ cos(180*i)*(post_rad+0.5*post_flange), cor_rad,0] ) {
rotate([ 90, 0, 0]){
cylinder(r = screw_rad, h=10, center=true);
}
}
}
}
}
}
}

// Arm and holder

// arm
translate([ 0, 0.5*arm_len + post_rad, 0]) {
rect_round(arm_wid, arm_len, thickness, cor_rad);
}

// holder
translate([ 0, 0.5*hol_len + arm_len + post_rad - 2*cor_rad, 0.5*thickness]) {
rect_round(hol_wid, hol_len, 2*thickness, cor_rad);
}


}
union() {

// Light holes
translate([ 0, 0.5*hol_len + arm_len + post_rad + 5 - 2*cor_rad, thickness]) {
rotate([ 90, 0, 0]){
cylinder(r = lig_rad, h=20, center=true);
}
}

translate([ 0, 0.5*hol_len + arm_len + post_rad - 2*cor_rad, thickness]) {
rotate([ 90, 0, 0]){
cylinder(r = soc_rad, h=20.1, center=true);
}
}

// grub screw hole

for(i=[0:1]) {
translate([ cos(180*i)*0.5*hol_wid, 0.5*hol_len + arm_len + post_rad + 2.5 - 2*cor_rad, 0.5*thickness] ) {
rotate([ 90, 0, 90]){
cylinder(r = screw_rad-.2, h=10, center=true);
}
}
}
}
}
