  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

// Parameters
number_of_teeth   = 10;
pitch = 2*PI/3;
thickness = 3;
pivot = 0.75; 

// Calculated
P = PI / pitch;
diameter = number_of_teeth/P;


a = 1/P;
b = 1.25/P;
ht = 2.25/P;
c = 0.25/P;
rf = 0.30/P;
Db = diameter*cos(20);
Do = (number_of_teeth+2)/P;
Dr = (number_of_teeth-2.5)/P;
t = 1.5708/P;
r = diameter/2;
h = diameter-Db;

l = 0.5*Db - 0.5*diameter*sin(360/(4*number_of_teeth));
//l = 0.5*Db -t/2;

echo(diameter,a,b,ht,c,rf,Db/2,Do,Dr,t,r,h,l);

// Bevel the edges
run = 0.5*(Do-diameter);
rise = 0.364*run;
bulk = thickness - 2*rise;
disp = thickness/2 - 0.5*rise;

echo(run, rise, bulk, disp);


difference(){
intersection(){
//envelope
union(){
translate([0,0, disp]){cylinder(r1 = Do/2, r2 = Do/2-run, h=rise,center=true); }
cylinder(r = Do/2, h=bulk, center=true);
translate([0,0,-disp]){cylinder(r1 = Do/2-run, r2 = Do/2, h=rise,center=true); }
}

//union(){
//translate([0,0,(1/2)*thickness]){cylinder(r1 =  }
//cylinder(r = Do/2, h=(2/3)*thickness, center=true);
//}

union(){
cylinder(r = Dr/2, h=thickness, center=true);
for(i=[1:number_of_teeth]){

angle = (i-1)*360/number_of_teeth;

rotate( [ 0, 0, angle] ){
   translate( [ 0.5*Db, 0, 0] ) {
         intersection() {
         translate([0,l,0]){cylinder( r = 0.5*Db, h=thickness, center=true);}
         translate([0,-l,0]){cylinder( r = 0.5*Db, h=thickness, center=true);}
         }
      }
   }
}
}
}

cylinder(r=pivot, h=thickness+1, center=true);
}