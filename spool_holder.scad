  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

length = 113;
width = 30;

feed_arm = 30;

holder_arm = 91;

arm_rad = 16;
arm_inner_rad = 13;

tab_wid = 18;
tab_height = 12;
tab_depth = 4;
tab_thick = 2.5;
tab_lip = 9;


difference(){


union(){

// spool arm
cylinder(h=holder_arm, r=arm_rad-.5, center=true);
// lip
translate([0,2,holder_arm/2-1]){cylinder(h=2, r=arm_rad, center=true);}
// back plate
translate([0,length/2-arm_rad,-holder_arm/2]){cube([arm_rad*2,length,5],center=true);}
// tab
translate([0,arm_rad-10,-holder_arm/2-5]){cube([tab_wid, tab_height, tab_thick], center=true);}
translate([0,arm_rad-5.5,-holder_arm/2-5+tab_thick]){cube([tab_wid, 3, tab_thick], center=true);}
// feed arm
translate([-10.75,92,-holder_arm/2+15]){cube([10,10,feed_arm],center=true);}



}


union(){
cylinder(h=holder_arm+.1, r=arm_inner_rad, center=true);
cube([18,34,holder_arm-20],center=true);
translate([6.1,67.1,-holder_arm/2]){cube([23,60,6],center=true);}
translate([16,37,-holder_arm/2]){rotate([0,0,45]){cube([30,30,6],center=true);}}
translate([-5,54,-holder_arm/2+3]){cube([30,65,6],center=true);}

translate([0,84,-35.5]){rotate([0,90,0]){cylinder(h=40,r=10,center=true);}}
translate([0,84,-15]){rotate([0,90,0]){cube([40,20,35],center=true);}}

translate([-10.75,94,-14]){rotate([90,0,0]){cylinder(h=10,r=1.5,center=true);}}
translate([-10.75,94,-20]){rotate([90,0,0]){cylinder(h=10,r=1.5,center=true);}}
translate([-10.75,94,-23]){cube([3,10,6],center=true);}
translate([-10.75,94,-17]){cube([1.2,10,6],center=true);}
translate([-10.75,94,-26]){rotate([90,0,0]){cylinder(h=10,r=1.5,center=true);}}

difference(){
cube([35,16,75],center=true);
rotate([-15,0,0]){cube([36,5,90],center=true);}
}

}
}
