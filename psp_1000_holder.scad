use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

psp_rad = 50;
c2c = 70;
psp_dep = 20;
psp_hig = 74;

small_rad = 31;

difference() {

// Holder

union() {
for(i=[0:1]) {

intersection() {
// Big Circles
translate( [ 0.5*c2c-i*c2c, 0.5*psp_hig-8, 0]) {
cylinder( r = c2c, h = 0.99*psp_dep, center=true);
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


}

// PSP Cutout
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
}
}