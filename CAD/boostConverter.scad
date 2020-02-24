include<variables.scad>
use <base_module.scad>

module boostCnvtr(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([cnvrtrHousingW, cnvrtrHousingL, cnvrtrHousingH]);
        

    }
}