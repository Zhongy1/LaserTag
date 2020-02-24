include<variables.scad>
use <base_module.scad>


module ledCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    compRegionW = 12;
    compRegionL = ledBrdL - 4;
    translate(offset) rotate(rotation){
        
        
        translate([ledHousingW/2, 0, -ledHousingD/2])
            solidBlock([ledHousingW, ledHousingD, ledHousingD]); 
        
        translate([ledBrdW/2 + ledHousingW, 0, -ledBrdH/2])
            solidBlock([ledBrdW, ledBrdL, ledBrdH]);
        
        translate([ledHousingW + ledBrdW + (compRegionW/2), 0, -ledBrdH/2])
            solidBlock([compRegionW, compRegionL, ledBrdH]);

        
    }
}