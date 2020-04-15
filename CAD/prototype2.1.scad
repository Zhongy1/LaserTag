use <base_modules.scad>
include<variables.scad>
use <controlCutout.scad>
use <ledCutout.scad>
use <boostConverter.scad>
use <batteryCutOut.scad>
use <switchCutOut.scad>

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
        translate([0, 0, gunPieceNozzleW/2])wire_path([-gunPieceNozzleL + 3.5 + 10, 0],[-70, 0], 5, 5);
        ledCutout([-gunPieceNozzleL + 3.5, 0, gunPieceNozzleW/2]);
        boostCnvtr([-17, 15, gunPieceNozzleW/2 - cnvrtrHousingH/2], [0, 0, 90]);
        translate([0, 0, gunPieceNozzleW/2])wire_path([-17,15], [-70, 0], 5, 5);
        translate([38, -26, 0])batteryCutOut([0, 0, gunPieceNozzleW/2 - batteryHousingH/2], [0, 0, -130]);
        switchCutout([-10, -25, gunPieceNozzleW/2 - switchHousingH/2], [0, 0, 50]);
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
    
