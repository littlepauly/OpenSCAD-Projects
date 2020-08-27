$fn = 0; $fa = 0.1; $fs = .1;

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
                        sphere(r = rad, center = true);                        
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


