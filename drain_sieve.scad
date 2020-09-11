$fn = 0; $fa = 0.1; $fs = .1;

rl = 23;
ru = 25;
d = 10;
ro = 30;
w = 2;
hr = 1.5;

phi = 2.39996323;
a = 2.5;

x =1;
difference(){

// Body

union(){
cylinder( h=d, r1=rl, r2=ru, center=true);
translate([ 0, 0, d/2 + w/4]){cylinder( h=w/2, r=ro, center=true);}
translate([ 0, 0, d/2 + 3*w/4]){cylinder( h=w/2, r1=ro, r2=rl, center=true);}
}


// Void
translate([ 0, 0, 1.01*w]){cylinder( h=d, r1=0.95*rl, r2=0.95*ru, center=true);}

// Holes
cylinder( h=2*d, r=hr, center=true);

for(i=[1:5]){
for(j=[1:(i*6)]){
   
   rotate([ 0, 0, (360/(6*i))*j ]){translate([ a*hr*i, 0, -d/2]){cylinder( h=d, r=hr, center=true);}}


}
}
}
