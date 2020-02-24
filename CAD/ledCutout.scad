include<variables.scad>
use <base_modules.scad>


module ledCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    compRegionW = 12;
    compRegionL = ledBrdL - 4;
    translate(offset) rotate(rotation){
        
        
        translate([ledHousingW/2, 0, -ledHousingD/2])
            solid_block([ledHousingW, ledHousingD, ledHousingD]); 
        
        translate([ledBrdW/2 + ledHousingW, 0, -ledBrdH/2])
            solid_block([ledBrdW, ledBrdL, ledBrdH]);
        
        translate([ledHousingW + ledBrdW + (compRegionW/2), 0, -ledBrdH/2])
            solid_block([compRegionW, compRegionL, ledBrdH]);

        
    }
}