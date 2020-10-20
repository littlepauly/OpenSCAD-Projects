use <functions.scad>

$fa=.5; // default minimum facet angle is now 0.5
$fs=.5; // default minimum facet size is now 0.5 mm

difference(){
import("/exports/planetary_gearbox/sun.stl", convexity=10, center=true);

rotate( [ 90, 0, 0,]) {hex_nut_cutout(7,50);};
}