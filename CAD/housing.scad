use <base_modules.scad>

letterDisplayWH = 25.08;
letterDisplayT = 1.72;
letterHoldPanelH = 27.55 - letterDisplayWH;
letterHoldPanelW = 12.4;

circBrdW = 37.96;
circBrdL = 25.27;
circBrdT = 1.68;
circBrdTopH = 2.5;
circBrdBotH = 2.5;
circBrdH = circBrdT + circBrdTopH + circBrdBotH;
circBrdErrorCompensation = 0.24;

ledOffset = 3.81;
ledOffsetFrmEdge = 5.08;

wallT = 1.4;
baseTopT = wallT + letterHoldPanelH;
baseW = circBrdW + 0.3 + wallT*4;
baseL = circBrdL + 0.3 + wallT*2;
baseH = circBrdH + baseTopT;

slitL = letterHoldPanelW + 0.2;
longSlitL = 32.73 + 0.2;
slitT = letterDisplayT + 0.3;

lockingHoleW = 3.5;
lockingHoleL = 5;
lockingHoleH = 2.5;
lockingShaftW = lockingHoleW - 0.3;
lockingShaftL = lockingHoleL - 0.3;
lockingShaftH = lockingHoleH - 0.15;

*letter_display([0, 0, circBrdH + wallT], [0, 0, 45]);
*circuit_board();
BaseV2();
*slit();



module BaseV1(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    innerW = circBrdW + 0.3;
    innerL = circBrdL + 0.3;
    translate(shift) { rotate(rotation) {
    
    
    difference() {
        translate([0, (innerL)/2 - ledOffsetFrmEdge, 0]) difference() {
            solid_block([baseW, baseL, baseH]);
            solid_block([innerW, innerL, circBrdH]);
        }
        for (i = [-4 : 4])
            slitV1([ledOffset*i + circBrdErrorCompensation, 0, 0], [0, 0, 45]);
        translate([0, baseL/2, baseH]) for (i = [-1 : 1])
            locking_hole([baseW/3*i, 0, 0]);
    }
    for(i = [-1 : 2 : 1]) for (j = [-1 : 2 : 1]) translate([j*(innerW-2)/2, (innerL)/2 - ledOffsetFrmEdge + i*(innerL-2)/2, circBrdH - circBrdTopH])
        solid_block([2, 2, circBrdTopH]);
    
    
    }}
}

module BaseV2(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    innerW = circBrdW + 0.3;
    innerL = circBrdL + 0.3;
    translate(shift) { rotate(rotation) {
    
    
    difference() {
        translate([0, (innerL)/2 - ledOffsetFrmEdge, 0]) difference() {
            solid_block([baseW, baseL, baseH]);
            solid_block([innerW, innerL, circBrdH]);
        }
        /*for (i = [-4 : 4])
            slit([ledOffset*i + circBrdErrorCompensation, 0, 0], [0, 0, 45]);*/
        slitV2([circBrdErrorCompensation, 0, 0], [0, 0, 90]);
        translate([0, baseL/2, baseH]) for (i = [-1 : 1])
            locking_hole([baseW/3*i, 0, 0]);
    }
    for(i = [-1 : 2 : 1]) for (j = [-1 : 2 : 1]) translate([j*(innerW-2)/2, (innerL)/2 - ledOffsetFrmEdge + i*(innerL-2)/2, circBrdH - circBrdTopH])
        solid_block([2, 2, circBrdTopH]);
    
    
    }}
}

module circuit_board(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    translate(shift) { rotate(rotation) {
    
    
    translate([0, (circBrdL)/2 - ledOffsetFrmEdge, 0])
        solid_block([circBrdW, circBrdL, circBrdH]);
    
    
    }}
}

module slitV1(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    render() translate(shift) { rotate(rotation) {
    
    
    difference() {
        union() {
            solid_block([slitT, slitL, baseH]);
            translate([0, 0, baseH]) rotate([180, 0, 0])
                inner_chamferring([slitT, slitL, 1], 0.3);
        }
        for (i = [-1 : 2 : 1]) translate([0, (slitL-slitL/4)/2*i, 0])
            solid_block([slitT, slitL/4, circBrdH + wallT - 0.2]);
    }
    
    
    }}
}

module slitV2(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    render() translate(shift) { rotate(rotation) {
    
    
    difference() {
        union() {
            solid_block([slitT, longSlitL, baseH]);
            translate([0, 0, baseH]) rotate([180, 0, 0])
                inner_chamferring([slitT, longSlitL, 1], 0.3);
        }
        *for (i = [-1 : 2 : 1]) translate([0, (slitL-slitL/4)/2*i, 0])
            solid_block([slitT, slitL/4, circBrdH + wallT - 0.2]);
    }
    
    
    }}
}

module letter_display(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    translate(shift) { rotate(rotation) {
    
    
    translate([0, 0, letterHoldPanelH])
        solid_block([letterDisplayT, letterDisplayWH, letterDisplayWH]);
    solid_block([letterDisplayT, letterHoldPanelW, letterHoldPanelH]);
    
    
    }}
}

module locking_hole(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    render() translate(shift) { rotate(rotation) {
    
    
    translate([0, 0, -lockingHoleH])
        solid_block([lockingHoleW, lockingHoleL, lockingHoleH]);
    rotate([180, 0, 0])
        inner_chamferring([lockingHoleW, lockingHoleL, 1], 0.3);
    
    
    }}
}

module _format_(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    translate(shift) { rotate(rotation) {
    
    
    
    
    
    }}
}