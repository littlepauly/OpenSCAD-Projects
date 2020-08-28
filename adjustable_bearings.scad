$fn = 0; $fa = 0.1; $fs = .1;

// INPUT PARAMETERS
or = 10;             // outer radius
ir = 5;              // inner radius
d  = 5;           // depth

ff = 0.01;           // fudge factor to seperate bearings from race. Default 1% 

// CALCULATED PARAMETERS
cr = (or + ir)/2;    // centre radius
cc = 2*PI*cr;        // centre circumference

rd = or - ir;        // difference b/w the radii

l = rd/7;            // rim thickness temp

nb = ceil(cc/(5*l)); // number of bearings

bor = cc/(2*nb);     // bearing outer radius
bir = bor*3/5;       // bearing inner radius

l = (rd - bor)/2;    // new rim thickness 

pf = ff*rd;          // play factor to seperate bearings from race

ang = 360/nb;        // Angular spacing of bearings


// OBJECT GENERATION

// Bearings

for(i = [0:nb-1]){
   rotate([ 0, 0, ang*i]){ translate([ cc, 0, 0]){
      union(){
         translate([ 0, 0, 3*d/7]){cylinder( h = d/7, r = bir, center = true);}
         translate([ 0, 0, 2*d/7]){cylinder( h = d/7, r1 = bir, r2 = bor, center = true);}
         cylinder( h = 3*d/7, r = bor, center = true);
         translate([ 0, 0, -2*d/7]){cylinder( h = d/7, r1 = bor, r2 = bir, center = true);}
         translate([ 0, 0, -3*d/7]){cylinder( h = d/7, r = bir, center = true);}
      }
   }}
}


// INNER RACE

