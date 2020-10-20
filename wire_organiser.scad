use <functions.scad>

$fa=.5; // default minimum facet angle is now 0.5
$fs=.5; // default minimum facet size is now 0.5 mm

difference() {
translate([ 200, -200, 0] ) { import("/exports/wire_organiser/wireorg.stl", convexity=10);}

translate([ -1.5 , 18, 8] ) {
rotate( [ 0, 90, 0]){
cylinder( r= 4, h = 40, center=true);} 
}

translate([ 0 , 18, 8] ) {
rotate( [ 0, 90, 0]){
cylinder( r= 2.5, h = 50, center=true);} 
}


}
