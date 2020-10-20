use <functions.scad>

$fa=.5; // default minimum facet angle is now 0.5
$fs=.5; // default minimum facet size is now 0.5 mm

//// Parameters ////

// handbars
bar_rad = 11.5;
cor_rad = 1.5;
dep = 12;

// nut holder
nut_hol_wid = 8;
nut_hol_len = 22;

nut_hol_x_off = bar_rad + 2.5*cor_rad;
nut_hol_y_off = 5;

// nut slot
ns_wid = 8;
ns_len = 2.5;
ns_dep = 10;

ns_x_off = 15;
ns_y_off = 8;
ns_z_off = 2;

// screw hole 

sh_rad = 2.25;
sh_len = 25;

sh_x_off = 15;
sh_y_off = 7;


// screw hole countersink 

shc_rad = 3.5;
shc_len = 7;

shc_x_off = 15;
shc_y_off = -9;

// rivet 

r_rad = 2.25;
r_len = 17;

r_x_off = 6;
r_y_off = 38;

// cut out
co_wid = 20;
co_len = 5;

co_x_off = bar_rad;


// leaver arm

la_wid = 45;
la_len = 7;

la_x_off = 10;
la_y_off = bar_rad + 2.5*cor_rad;

// bell bar

bb_len = 28;
bb_wid = dep;
bb_dep = dep;

bb_x_off = 6;
bb_y_off = 0.5*bb_len + la_len + bar_rad - 2* cor_rad;


// hammer
// head

hh_len = 7;
hh_wid = 17;

hh_x_off = 32;
hh_y_off = 34;


// impactor

hi_len = 1;
hi_wid = 1;
hi_dep = 6;

hi_x_off = -0.5*hh_wid; //realtive not global


// spring

hs_wid = 0.5;
hs_sep = 5 - hs_wid;
hs_rad = 15;
hs_ang = 70;

hs_len = 20;

hs_x_off = 24;
hs_y_off = 25;


//triangle

tr_len = 13;
tr_wid = 7;

tr_x_off = bar_rad-0.5;
tr_y_off = tr_x_off;

////////////////////////////////////////////////////////////////////////////////

difference(){
union(){

// ring

rotate_extrude(angle = 360){
translate([ bar_rad+cor_rad, 0 ,0]){

// Cross Section
projection(){
union(){
for(i=[0,1]){
rotate([ 0, 0, 180*i]){
round_edge_extrusion( cor_rad, dep);
}
}
}
}
}
}

// nut holder

translate( [ nut_hol_x_off, nut_hol_y_off , 0] ) {
rect_round( nut_hol_wid, nut_hol_len, dep, cor_rad);
}


// leaver arm

translate( [ la_x_off, la_y_off, 0] ) {
rect_round( la_wid, la_len, dep, cor_rad);
}


// bell bar

translate( [ bb_x_off, bb_y_off, 0] ) {
rect_round( bb_wid, bb_len, dep, cor_rad);
}

// hammer
// head


translate( [ hh_x_off, hh_y_off, 0] ) {
rotate([ 0, 0, -5] ) {
union() {

difference(){
rect_round( hh_wid, hh_len, dep, cor_rad);
// grooves
for(i=[0:4]){
translate( [ 0.35*hh_wid - i*2, 0.5*hh_len , 0]) {
cube([ hi_wid, hi_len, 1.25*hi_dep], center = true);
}
}
}
translate( [ hi_x_off, -0.25*hh_len, 0] ) {
cube([ hi_wid, hi_len, hi_dep], center = true);
}
}
}
}
// springs
for(i=[0:1]){
translate( [ hs_x_off+i*hs_sep+hs_rad, hs_y_off, 0] ) {

rotate([ 0, 0, 145]){
rotate_extrude( angle = hs_ang ){
translate([hs_rad, 0,0]){
square( [hs_wid, dep], center=true);
}
}
}
}
}
// triangle

translate( [ tr_x_off, tr_y_off, 0]) {
rotate( [ 0, 0, 45]) {
cube( [ tr_wid, tr_len, dep], center=true);
}
}

}

// Difference sections

// nut slot

translate( [ ns_x_off, ns_y_off, ns_z_off] ) {
cube( [ns_wid, ns_len, ns_dep], center=true);
}

// screw_hole

translate( [ sh_x_off, sh_y_off, 0] ) {
rotate([ 90, 0 ,0]) { 
cylinder( r = sh_rad, h = sh_len, center=true);
}
}

// skrew counter sink

translate( [ shc_x_off, shc_y_off, 0] ) {
rotate([ 90, 0 ,0]) { 
cylinder( r = shc_rad, h = shc_len, center=true);
}
}

// rivet

translate( [ r_x_off, r_y_off, 0] ) {
rotate([ 90, 0 ,0]) { 
cylinder( r = r_rad, h = r_len, center=true);
}
}

// cut out

translate( [ co_x_off, 0, 0] ) {
cube( [co_wid, co_len, 1.01*dep], center=true);
}
}