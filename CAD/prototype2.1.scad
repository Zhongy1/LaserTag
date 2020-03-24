use <base_modules.scad>
include<variables.scad>
use <controlCutout.scad>
use <ledCutout.scad>

gun_bottom();

module gun_bottom() {
    difference() {
        intersection() {
            translate([0, 0, gunPieceNozzleW/2]) rotate([0, 180, 0]) {
                body();
                handle();
            }
            solid_block([300, 200, gunPieceNozzleW/2]);
        }
        ctlrCutoutV2([-70, 0, gunPieceNozzleW/2 - microCtlrHousingH/2]);
        ledCutout([-gunPieceNozzleL + 3.5, 0, gunPieceNozzleW/2]);
    }
}

module body(){
    translate([-3.5, -1, 0]){
        
    rotate([0, 90, 0])
        difference(){
                    solid_cylinder([gunPieceNozzleW, gunPieceNozzleW, gunPieceNozzleL]);
                    translate([-5, -6 ,-13]) rotate([-20, 0, 0])
                        solid_block([gunPieceHandleW+10, gunPieceHandleW +10, 25]);
            
                }
     }
}

module handle(){
    translate([-60, -59, 0]){
        rotate([0, 90, 40.5])
            difference(){
                solid_cylinder([gunPieceHandleW, gunPieceHandleW, gunPieceHandleL]);
                translate([0, 0 ,gunPieceHandleL-10]) rotate([20, 0, 0])
                    solid_block([gunPieceHandleW+5, gunPieceHandleW +5, 20]);
            
            }
    }
 }
    
