use <base_modules.scad>


lensDiam = 25;

Attachment([0, -40, 0]);
Attachment([0, 40, 0]);
*for (i = [0 : 4]) {
    translate([i * 20, 0, 0])
        solid_block([10, 10, 10]);
}

module Attachment(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    translate(shift) { rotate(rotation) {
    
    
    intersection() {
        difference() {
            translate([30, 0, 0])
                solid_block([60, 40.43 + 20, 55.29 + 20]);
            translate([5, 0, 10])
                solid_block([10, 40.43, 55.29]);
            translate([0, 0, (55.29 + 20)/2])rotate([0, 90,0])
                solid_cylinder([lensDiam-1, lensDiam-1, 60]);
            for (i = [0 : 9]) {
                translate([i * 6 + 10, 0, (55.29 + 20 - lensDiam)/2])
                    solid_block([2.36, lensDiam, lensDiam]);
            }
        }
        translate([30, 0, 0])
            solid_block([60, 40.43 + 20, (55.29 + 20)/2]);
    }
    
    
    }}
}


