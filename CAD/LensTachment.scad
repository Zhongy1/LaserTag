

lensDiam = 25;

Attachment();
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
            #translate([30, 0, (55.29 + 20 - (lensDiam-1))/2])
                solid_block([60, lensDiam-1, lensDiam-1]);
            #for (i = [0 : 9]) {
                translate([i * 6 + 10, 0, (55.29 + 20 - lensDiam)/2])
                    solid_block([2, lensDiam, lensDiam]);
            }
        }
        translate([30, 0, 0])
            solid_block([60, 40.43 + 20, (55.29 + 20)/2]);
    }
    
    
    }}
}




module solid_block(dimensions){
    translate([0, 0, dimensions[2]/2])
        cube(dimensions, true);
}

module solid_block_chamfered(dimensions, chamferWidth = 0) {
    difference() {
        solid_block(dimensions);
        for (i = [0 : 1]) {
            translate([(i%2)*(dimensions[0]-chamferWidth)/2, (1-i%2)*(dimensions[1]-chamferWidth)/2, chamferWidth/2])
            rotate([-135*(1-i%2), 135*(i%2), 0])
                solid_block(
                            [(1-i%2)*dimensions[0] + (i%2)*chamferWidth*2, 
                             (i%2)*dimensions[1] + (1-i%2)*chamferWidth*2, 
                             chamferWidth]);
            translate([-(i%2)*(dimensions[0]-chamferWidth)/2, -(1-i%2)*(dimensions[1]-chamferWidth)/2, chamferWidth/2])
            rotate([135*(1-i%2), -135*(i%2), 0])
                solid_block(
                            [(1-i%2)*dimensions[0] + (i%2)*chamferWidth*2, 
                             (i%2)*dimensions[1] + (1-i%2)*chamferWidth*2, 
                             chamferWidth]);
        }
    }
}

module _format_(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    translate(shift) { rotate(rotation) {
    
    
    
    
    
    }}
}