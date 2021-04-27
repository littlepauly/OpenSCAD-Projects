/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Auto generate a rectangle with rounded edges and corners
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module rect_round(length,width,depth,rad) {
    
    // long sides
    l1 = length - 2*rad;
      
    // wide sides
    w1 = width - 2*rad;
    
    // deep sides
    d1 = depth - 2 * rad;
    
    // central rect l1 x w1 x d1
    
    union() {
        // corner spheres - locations defined by l1 w1 d1
        for ( i = [-1,1] ) {
            for ( j = [-1,1] ) {
                for ( k = [-1,1] ) {
                    //spheres
                    translate([i*(l1/2),j*(w1/2),k*(d1/2)]){
                        sphere(r = rad);                        
                        }  
                    }
                }
            }
        
        // face rectangles
        for ( i = [-1,1] ) {
            
            //x
            translate([i*(l1+rad)/2,0,0]){
                cube([rad,w1,d1],center=true); 
                }
            //y
            translate([0,i*(w1+rad)/2,0]){
                cube([l1,rad,d1],center=true); 
                }
            //z
            translate([0,0,i*(d1+rad)/2]){
                cube([l1,w1,rad],center=true); 
                }
            }
         // edge cylinders       
         for ( i = [-1,1] ) {
             for ( j = [-1,1] ){
            // short
            translate([i*(l1/2),j*(w1/2),0]){
                cylinder(h=d1 ,r=rad, center=true); 
                }
            // mid
            translate([i*(l1/2),0,j*(d1/2)]){
                rotate(a=90,v=[1,0,0]){
                    cylinder(h=w1 ,r=rad, center=true);
                    }
                }
            // long
            translate([0,i*(w1/2),j*(d1/2)]){
                rotate(a=90,v=[0,1,0]){
                    cylinder(h=l1 ,r=rad, center=true);
                    }
                }
            }
            }  
            // central cube
            cube([l1,w1,d1],center=true);
        }
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Auto generate cutouts for nuts, where length is the distance b/w parallel sides and thickness is the nut thickness or cutout depth
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module hex_nut_cutout(length, thickness) {



   
   hex_side_length = length / sqrt(3);

   union(){
      cube([hex_side_length,thickness,length], center=true);
      rotate([0,60,0]){cube([hex_side_length,thickness,length], center=true);}
      rotate([0,120,0]){cube([hex_side_length,thickness,length], center=true);}
   }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Auto generate a spherical section with a flat face, where radius is the radius  of the sphere, and fraction is the of the diameter required
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module  sphere_fraction(radius, fraction) {

difference() {
   
   sphere( r=radius, center=true);

   translate( [ 0, 0, -(fraction)*radius]){ cube([ 2.01*radius, 2.01*radius, 2.001*(1-fraction)*radius], center=true);}

}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Gear Generator
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module gear_generator( number_of_teeth, pitch, thickness, pivot ){

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
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rounded Edges for Extrusions
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module round_edge_extrusion( cor_rad, tot_dep) {

dep = tot_dep - 2*cor_rad;
offset = 0.5*dep;


// shape to be extruded
union() {
// radius
for( i=[0,1]) {

translate( [ 0, cos(180*i)*offset, 0] ) {
rotate_extrude( angle = 90-i*180 ) {
translate( [ cor_rad-0.5*cor_rad, 0, 0] ) {square( [cor_rad, 1], center=true);}
}
}
}

translate( [ cor_rad-0.5*cor_rad, 0, 0] ) {cube([ cor_rad, dep, 1], center=true);}

}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ring Arc Extrusion Rounded Edges
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module ring_arc( radius, angle, cor_rad, tot_dep){
rotate_extrude(angle = angle){
translate([ radius+cor_rad, 0 ,0]){

// Cross Section
projection(){
union(){
for(i=[0,1]){
rotate([ 0, 0, 180*i]){
round_edge_extrusion( cor_rad, tot_dep);
}
}
}
}
}
}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Triangular prism
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   module triangular_prism(l, w, h){
       polyhedron(
               points=[[-0.5*l, -0.5*w, -0.5*h], [ 0.5*l, -0.5*w, -0.5*h],
                        [ 0.5*l, 0.5*w, -0.5*h], [ -0.5*l, 0.5*w, -0.5*h],
                        [ -0.5*l, 0.5*w, 0.5*h], [ 0.5*l, 0.5*w, 0.5*h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
       

       }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rectangle array
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module rect_array( x_no, x_dim, x_cc, y_no, y_dim, y_cc, z_no, z_dim, z_cc) {

for(i=[0:x_no-1]){
for(j=[0:y_no-1]){
for(k=[0:z_no-1]){

x_off = -0.5*x_no*x_cc + 0.5*x_cc;
y_off = -0.5*y_no*y_cc + 0.5*y_cc;
z_off = -0.5*z_no*z_cc + 0.5*z_cc;


translate( [ i*x_cc + x_off, j*y_cc + y_off, k*z_cc + z_off] ) {

cube([ x_dim, y_dim, z_dim], center = true);

}
}
}
}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rectangle array
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module cylinder_array(radius, height, x_no, x_cc, y_no, y_cc, z_no, z_cc) {

for(i=[0:x_no-1]){
for(j=[0:y_no-1]){
for(k=[0:z_no-1]){

x_off = -0.5*x_no*x_cc + 0.5*x_cc;
y_off = -0.5*y_no*y_cc + 0.5*y_cc;
z_off = -0.5*z_no*z_cc + 0.5*z_cc;


translate( [ i*x_cc + x_off, j*y_cc + y_off, k*z_cc + z_off] ) {

cylinder( r = radius, h = height, center = true);

}
}
}
}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////