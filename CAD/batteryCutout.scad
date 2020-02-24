include<variables.scad>
use <base_module.scad>

//
module batteryCutOut(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        solidBlock([batteryHousingW, batteryHousingL, batteryHousingH]);
        for(i = [-1:2:1]){
            translate([0,i * (batteryHousingL + batteryContactsH) / 2, -(batteryContactsW - batteryHousingH) / 2])
                solidBlock([batteryContactsW, batteryContactsH, batteryContactsW]);
        }
        
    }
}