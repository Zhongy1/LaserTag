include<variables.scad>
use <base_module.scad>

module switchCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([switchHousingW, switchHousingL, switchHousingH]);
        
        
    }
}