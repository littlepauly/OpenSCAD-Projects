  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

difference(){
union(){
cylinder(h=5,r=13,center=true);
translate([0,0,3]){cylinder(h=1.5,r=17,center=true);}
}
cylinder(h=10,r=10,center=true);
}