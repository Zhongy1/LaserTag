
//GunPieceBottom();
//boardCutout();


difference(){
        GunPieceBottom();
        #boardCutout();
}

module GunPieceBottom(){
    solidBlock([100, 30, 15]);
    translate([49,18.5,0]){
        //handle piece
        rotate([0, 0, 155]){
            solidBlock([30, 60, 15]);
        }
    }
    
}

module boardCutout(){
    translate([0, 0, 6]){
        solidBlock([35, 20, 4]);
    }
}    

module solidBlock(dimensions){
    translate([0, 0, dimensions[2]/2]);
        cube(dimensions, true);
}
