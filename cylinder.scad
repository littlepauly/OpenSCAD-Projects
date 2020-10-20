$fa=2; // default minimum facet angle is now 0.5
$fs=2; // default minimum facet size is now 0.5 mm


union() {
cylinder(r = 22, h = 180-22, center=true); 
translate([ 0, 0, 90-11]) { sphere( r =22 );}
}