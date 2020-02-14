

*difference() {
    n_edged_block([3+$t*10, 5, 5]);
    translate([0, 0, 1]) n_edged_block([3+$t*10, 4, 5]);
}
//elongated_cylinder([1, 1, 4]);
difference() {
    solid_block_chamferred([10, 10, 10], 5*$t);
    translate([0, 0, -0.001]) inner_chamferring([10-(5*$t + 1)*2, 10-(5*$t + 1)*2], 1);
}
//inner_chamferring([-1, -1], 1);

//dimensions = [number of edges, distance from corner to center, height]
module n_edged_block(dimensions) {
    n = dimensions[0];
    r = dimensions[1];
    height = dimensions[2];
    angles = [ for (i = [0:n-1]) i*(360/n) ];
    coords = [ for (th=angles) [r*cos(th), r*sin(th)] ];
    linear_extrude(height, convexity = 10)
        polygon(coords);
}

//dimensions = [lower diameter, upper diameter, height]
module solid_cylinder(dimensions) {
    translate([0, 0, dimensions[2]/2])
        cylinder(dimensions[2], d1= dimensions[0], d2 = dimensions[1], center = true, $fn = 100);
}

//dimensions = [diameter of cylinder, elongation from center, height]
module elongated_cylinder(dimensions) {
    radius = dimensions[0]/2;
    for (i = [-1 : 2 : 1]) translate([i * dimensions[1]/2, 0, 0])
        cylinder(dimensions[2], radius, radius, $fn=100);
    #solid_block([dimensions[1], dimensions[0], dimensions[2]]);
}

//dimensions = [width(x), length(y), height(z)]
module solid_block(dimensions) {
    translate([0, 0, dimensions[2]/2])
        cube(dimensions, true);
}

//dimensions = [width(x), length(y), height(z)]
//chamferWidth = width of cut on bottom corners
module solid_block_chamferred(dimensions, chamferWidth = 0) {
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

//mainly used for subtration
//dimensions = [width(x), length(y)]
//chamferWidth = height and extra width that is meant to be subtracted
module inner_chamferring(dimensions, chamferWidth = 0) {
    dimensions = [dimensions[0]+chamferWidth*2, dimensions[1]+chamferWidth*2, chamferWidth];
    difference() {
        solid_block(dimensions);
        for (i = [0 : 1]) {
            translate([(i%2)*(dimensions[0]-chamferWidth)/2, (1-i%2)*(dimensions[1]-chamferWidth)/2, chamferWidth/2])
            rotate([-45*(1-i%2), 45*(i%2), 0])
                solid_block(
                            [(1-i%2)*dimensions[0] + (i%2)*chamferWidth*2, 
                             (i%2)*dimensions[1] + (1-i%2)*chamferWidth*2, 
                             chamferWidth]);
            translate([-(i%2)*(dimensions[0]-chamferWidth)/2, -(1-i%2)*(dimensions[1]-chamferWidth)/2, chamferWidth/2])
            rotate([45*(1-i%2), -45*(i%2), 0])
                solid_block(
                            [(1-i%2)*dimensions[0] + (i%2)*chamferWidth*2, 
                             (i%2)*dimensions[1] + (1-i%2)*chamferWidth*2, 
                             chamferWidth]);
        }
    }
}

//for bigger modules, copy and paste and replace __format__ with the name of the module you are creating
module _format_(shift = [0, 0, 0], rotation = [0, 0, 0]) {
    translate(shift) { rotate(rotation) {
    
    
    
    
    
    }}
}