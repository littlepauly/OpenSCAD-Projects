$fn = 0; $fa = 0.1; $fs = .1;

// INPUT PARAMETERS
or = 11;             // outer radius
ir = 4;              // inner radius
d  = 7;           // depth

ff = 0.01;           // fudge factor to seperate bearings from race. Default 0.5% 

// CALCULATED PARAMETERS
cr = (or + ir)/2;    // centre radius
cc = 2*PI*cr;        // centre circumference

rd = or - ir;        // difference b/w the radii

ll = rd/7;            // rim thickness temp

nb = ceil(cc/(5*ll)); // number of bearings

bor = cc/(2*nb);     // bearing outer radius
bir = bor*3/5;       // bearing inner radius

l = (rd - bor*2)/2;    // new rim thickness
m = (rd - bir*2)/2;    // rim cap 


pf = ff*rd;          // play factor to seperate bearings from race

ang = 360/nb;        // Angular spacing of bearings

echo(or,ir,d,ff,cr,cc,rd,ll,nb,bor,bir,l,pf,ang);

// OBJECT GENERATION

// Bearings

for(i = [0:nb-1]){
   rotate([ 0, 0, ang*i]){ translate([ cr, 0, 0]){
      union(){
         translate([ 0, 0, 3*d/7]){cylinder( h = d/7, r = bir-pf, center = true);}
         translate([ 0, 0, 2*d/7]){cylinder( h = d/7, r1 = bor-pf, r2 = bir-pf, center = true);}
         cylinder( h = 3*d/7, r = bor-pf, center = true);
         translate([ 0, 0, -2*d/7]){cylinder( h = d/7, r1 = bir-pf, r2 = bor-pf, center = true);}
         translate([ 0, 0, -3*d/7]){cylinder( h = d/7, r = bir-pf, center = true);}
      }
   }}
}

// INNER RACE

difference(){
union(){
   translate([ 0, 0, 3*d/7]){cylinder( h = d/7, r = ir+m-pf, center = true);}
   translate([ 0, 0, 2*d/7]){cylinder( h = d/7, r1 = ir+l-pf, r2 = ir+m-pf, center = true);}
   cylinder( h = 3*d/7, r = ir+l-pf, center = true);
   translate([ 0, 0, -2*d/7]){cylinder( h = d/7, r1 = ir+m-pf, r2 = ir+l-pf, center = true);}
   translate([ 0, 0, -3*d/7]){cylinder( h = d/7, r = ir+m-pf, center = true);}
}
cylinder( h = d+2*pf, r = ir, center = true);
}

// OUTER RACE

difference(){

cylinder( h = d, r = or, center = true);

union(){
   translate([ 0, 0, 3*d/7]){cylinder( h = d/7+pf, r = or-m+pf, center = true);}
   translate([ 0, 0, 2*d/7]){cylinder( h = d/7, r1 = or-l+pf, r2 = or-m+pf, center = true);}
   cylinder( h = 3*d/7, r = or-l+pf, center = true);
   translate([ 0, 0, -2*d/7]){cylinder( h = d/7, r1 = or-m+pf, r2 = or-l+pf, center = true);}
   translate([ 0, 0, -3*d/7]){cylinder( h = d/7+pf, r = or-m+pf, center = true);}
}
}