use <base_modules.scad>
include<variables.scad>

body();
handle();

module body(){
    translate([-3.5, -1, 0]){
        
    rotate([0, 90, 0])
        difference(){
                    solid_cylinder([gunPieceNozzleW, gunPieceNozzleW, gunPieceNozzleL]);
                    translate([-5, -6 ,-13]) rotate([-20, 0, 0])
                        #solid_block([gunPieceHandleW+10, gunPieceHandleW +10, 25]);
            
                }
     }
}

module handle(){
    translate([-60, -59, 0]){
        rotate([0, 90, 40.5])
            difference(){
                solid_cylinder([gunPieceHandleW, gunPieceHandleW, gunPieceHandleL]);
                translate([0, 0 ,gunPieceHandleL-10]) rotate([20, 0, 0])
                    #solid_block([gunPieceHandleW+5, gunPieceHandleW +5, 20]);
            
            }
    }
 }
    
