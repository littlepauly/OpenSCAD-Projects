use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

psp_rad = 50;
c2c = 70;
psp_dep = 20;
psp_hig = 74;

small_rad = 27.5;
big_rad = 67;

bottom_wid = 4;

// TO DO
//
// - Cut out holes for back wings
// - Rounded extrutions

difference() {

// Holder
union() {

// Bottom section
translate([ 0,  0.5*(psp_hig+bottom_wid),0]){
cube([ 2*psp_rad, bottom_wid, psp_dep], center=true);
}

for(i=[0:1]) {

intersection() {
// Big Circles
translate( [ 0.5*c2c-i*c2c, 0.5*psp_hig-8, 0]) {
cylinder( r = big_rad, h = 0.99*psp_dep, center=true);
}

union() {
// Small Circles
translate( [ psp_hig-2*i*psp_hig, 0.5*psp_hig, 0]) {
cylinder( r = small_rad, h = 0.99*psp_dep, center=true);
}
// Rectangle to Carve out Volume

cube([ 4*c2c, 0.99*psp_hig, psp_dep], center=true);

}
}
}

// Curved Edges
/////////////////////////////////////////////
r=3;
l=14;

for(i=[0:1]) {

// Big Ring

translate( [ 0.5*c2c-i*c2c, 0.5*psp_hig-8, 0]) {
rotate([ 0, 0, 90-cos(180*i)*(160)]) {
rotate_extrude(angle = cos(180*i)*85){

/////////////////////////// Extruded Shape
projection() {
rotate( [ 0, 0, 0] ){
translate([ big_rad, 0, 0] ) {

// shape to be extruded
union() {
// radius
for( i=[0,1]) {

translate( [ 0, i*l-0.5*l, 0] ) {
rotate_extrude( angle = -90+i*180 ) {
translate( [ r-0.5*r, 0, 0] ) {square( [r, 1], center=true);}
}
}
}

translate( [ r-0.5*r, 0, 0] ) {cube([ r, l, 1], center=true);}

}
}
}
}
///////////////////////////
}
}
}

// Small Ring

translate( [ psp_hig-2*i*psp_hig, 0.5*psp_hig, 0]) {
rotate([ 0, 0, -15]) {
rotate_extrude(angle = 210){

projection() {
rotate( [ 0, 0, 0] ){
translate([ small_rad, 0, 0] ) {

// shape to be extruded
union() {
// radius
for( i=[0,1]) {

translate( [ 0, i*l-0.5*l, 0] ) {
rotate_extrude( angle = -90+i*180 ) {
translate( [ r-0.5*r, 0, 0] ) {square( [r, 1], center=true);}
}
}
}

translate( [ r-0.5*r, 0, 0] ) {cube([ r, l, 1], center=true);}

}
}
}
}
}
}
}
}
///////////////////////////////////////////////

}

// PSP Cutout
/////////////////////////////////////////////////

// Bulk
translate([ 0, 0, 2]) {
union() {

// PSP Cutout
difference() {

union(){

for(i=[0:1]) {

translate( [ 0.5*c2c-i*c2c, 0, 0]) {
cylinder( r = psp_rad, h = psp_dep, center=true);

}
}

cube([ c2c, psp_hig, psp_dep], center=true);

}

union() {

for(i=[0:1]) {

translate( [ 0, psp_hig - 2*i*psp_hig, 0]) {
cube([ 2*c2c, psp_hig, 1.01*psp_dep], center=true);
}
}
}
}

translate( [ 0, 7.5-psp_hig, 0]) {
cube([ 3*c2c, psp_hig, 1.01*psp_dep], center=true);
}

}

// Panels

for(i=[0:1]) {
intersection(){

translate( [ cos(180*i)*0.5*(c2c-3), 0, -5]) {
cylinder( r = psp_rad, h = psp_dep, center=true);
}
translate( [ cos(180*i)*0.5*(c2c-3) + cos(180*i)*0.5*psp_rad, 0, -5] ) {
cube([ psp_rad, psp_hig-8, psp_dep], center=true);

}
}

// Power cutout

pw_dep = 13;
pw_wid = 12;
pw_len = 25;

translate( [ -psp_hig + 0.5*pw_len, 0.5*psp_hig+1, 2]) {
cube([ pw_len, 1.01*pw_wid, pw_dep], center = true);
}

// Power cutout

sp_dep = 13;
sp_wid = 6;
sp_len = 6;

translate( [ 50, 0.5*psp_hig+1, 2]) {
cube([ sp_len, 1.01*sp_wid, sp_dep], center = true);
}

// Head Phone cutout

hp_rad = 6;
hp_dep = 60;

translate( [ 71, 0.5*psp_hig, -9]){
rotate( [ 90, 0, 0]) {
cylinder( r = hp_rad, h = hp_dep, center=true);
}
}

// Excess Crap Removal

ex_dep = 13;
ex_wid = 6;
ex_len = 6;

translate( [ 0, -4, -4]) {
cube([ 2*c2c, 1.01*psp_hig, psp_dep], center = true);
}


/////////////////////////////////////////////////////
}
}
}