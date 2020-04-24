use <base_modules.scad>

translate([10, -(55 - 4)/2, 55/2]) rotate([0, 0, 1*$t]) triggerPiece();
triggerTester();

module triggerTester() {
    difference() {
        intersection() {
            solid_block([55, 55, 55]);
            solid_block([55, 55, 55/2]);
        }
        translate([10, 0, (55-6.35)/2]) {
            solid_block([10, 55, 6.35]);
        }
        translate([-6.5, 5, (55 - 10.13+1)/2]) solid_block([22.44 + 1, 38.03 + 1, 10.13 + 1]);
    }            
    translate([10, -(55 - 4)/2, (55 - 6.35-0.5)/2]) solid_cylinder([4-0.5, 4-0.5, (6.35 + 0.5)/2]);
}

module triggerPiece() {
    translate([0, -6]) rotate([0, 0, 15]) {
        difference() {
            circle(d=8, $fn=100);
            translate([-4, 0]) circle(4, $fn=100);
        }
        rotate([0, 0, -15]) translate([0, 30]) difference() {
            union() {
                translate([0, 4 - 55/4]) square([8, 55/2], true);
                translate([0, -24]) circle(d=8, $fn=100);
            }
            translate([0, -24]) circle(d=4, $fn = 100);
        }
    }
}