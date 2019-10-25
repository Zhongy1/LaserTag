
//GunPieceBottom();
//boardCutout();


difference(){
        GunPieceBottom();
        #boardCutout();
        #batteryCutOut();
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
        solidBlock([35, 20, 4 + 0.01]);
    }
}  

module batteryCutOut(){
    translate([50, 20, 4]){
        rotate([0, 0, 65]){
            solidBlock([45, 20, 10]);
        }
    }
}

module solidBlock(dimensions){
    translate([0, 0, dimensions[2]/2]);
        cube(dimensions, true);
}
