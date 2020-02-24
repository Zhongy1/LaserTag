include<variables.scad>
use <base_module.scad>

module ctlrCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    ctlrRegionL = microCtlrHousingL - 6;
    legH = 3;
    brdT = circBrdT + 0.4;
    
    
    translate(offset) rotate(rotation){
        
        
        solidBlock([microCtlrHousingW, ctlrRegionL, microCtlrHousingH]);
        
        translate([0, 0, legH]){
            solidBlock([microCtlrHousingW, microCtlrHousingL, brdT]);
        }
        
        
    }
}