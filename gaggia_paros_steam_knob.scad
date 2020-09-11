use <functions.scad>

$fn = 100; $fa = 0.1; $fs = .1;


r01 = 27.5;
h01 = 2;

r02 = 22.25;
h02 = 8;

r03 = 20;
frac = 0.5;

r04 = 90;


difference() {
union() {

translate( [ 0, 0, -r04 + 0.5*h02 + h01] ) { sphere_fraction( r04, h01/r04) ;}

translate( [ 0, 0, 0.5*h01] ) {cylinder( r=r01, h=h01, center=true );}

translate( [ 0, 0, -0.5*h02] ) { cylinder( r=r02, h=h02, center=true );}

translate( [ 0, 0, 0] ) { rotate( [ 0, 180, 0] ) { sphere_fraction( r03, frac );}}

}

translate( [ 0, 0, -r01-17] ) {cube( [ 2*r01, 2*r01, 2*r01 ], center=true );}

translate( [ 0, 0, 0] ) {cylinder( r=3, h=12, center=true );}

cylinder( r=1.6, h=90, center=true );


translate( [ 0, 0, -12.6] ) {
difference() {

cylinder( r=4.1, h=9, center=true );

union(){
translate( [ 0, 7.01, 0 ] ) { cube( [ 8, 8, 9.01 ], center = true);}
translate( [ 0, -7.01, 0 ] ) { cube( [ 8, 8, 9.01 ], center = true);}
}
}

union(){
translate( [ 0, 0, 25 ] ) { rotate( [ 0, 90, 0] ) { sphere_fraction( r02, 1/3 );}}
translate( [ 0, 0, 25 ] ) { rotate( [ 0, -90, 0] ) { sphere_fraction( r02, 1/3 );}}
}
}
}