include<variables.scad>
use <base_modules.scad>


module boostCnvtr(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solid_block([cnvrtrHousingW, cnvrtrHousingL, cnvrtrHousingH]);
        

    }
}