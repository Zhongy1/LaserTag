include<variables.scad>
use <base_modules.scad>


module ctlrCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    ctlrRegionL = microCtlrHousingL - 6;
    legH = 3;
    brdT = circBrdT + 0.4;
    
    
    translate(offset) rotate(rotation){
        
        
        solid_block([microCtlrHousingW, ctlrRegionL, microCtlrHousingH]);
        
        translate([0, 0, legH]){
            solid_block([microCtlrHousingW, microCtlrHousingL, brdT]);
        }
        
        
    }
}