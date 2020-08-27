  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm
 
rad = 2.7; 

for(i=[0:7]){
translate([rad*cos(45*i),rad*sin(45*i),0]){sphere(radius=2.5,center=true);}
 }


difference(){
union(){
    cylinder(h=2.7,r=1.65,center=true);
    translate([0,0,1.1]){cylinder(h=0.5,r=2.15,center=true);}
    translate([0,0,-1.1]){cylinder(h=0.5,r=2.15,center=true);}
}
cylinder(h=3.1,r=1,center=true);
}

difference(){
union(){
    
    cylinder(h=2.7,r=4.25,center=true);
}
union(){
    
    cylinder(h=1.7,r=3.75,center=true);
    translate([0,0,1.1]){cylinder(h=0.501,r=3.25,center=true);}
    translate([0,0,-1.1]){cylinder(h=0.501,r=3.25,center=true);}

}
}