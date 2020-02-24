include<variables.scad>
use <base_modules.scad>

module switchCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solid_block([switchHousingW, switchHousingL, switchHousingH]);
        
        
    }
}