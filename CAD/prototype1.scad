include <variables.scad>
//GunPieceBottom();
//boardCutout();

//solidBlock([tempVar, tempVar, tempVar]);
*difference(){
        GunPieceBottom();
        boardCutout();
        batteryCutOut();
}
*ctlrCutout([0, 0, 10], [0, 0, 45]);

GunPieceBottom();

module GunPieceBottom(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
    
        difference(){
            union(){
                solidBlock([gunPieceNozzleL, gunPieceNozzleW, gunPieceBotH]);
                translate([71,-30,0]){
                    //handle piece
                    rotate([0, 0, -155]){
                        solidBlock([gunPieceHandleW, gunPieceHandleL, gunPieceBotH]);
                    }
                }
            }
            #ctlrCutout([0, 0, gunPieceBotH - microCtlrHousingH + microCtlrHousingH / 2]);
            #batteryCutOut([82, -40, gunPieceBotH - batteryHousingH + batteryHousingH / 2], [0, 0, -155]);
            #boostCnvtr([81, 0, gunPieceBotH - cnvrtrHousingH / 2], [0, 0, -155]);
            #switchCutout([56, -44, gunPieceBotH - switchHousingH / 2], [0, 0, -155]);
            #ledCutout([-75, 0, gunPieceBotH - ledHousingD / 2]);
        }
            
        
    }//translate
}

module boardCutout(){
    translate([0, 0, 11]){
        solidBlock([35, 20, 4 + 0.01]);
    }
}  

module batteryCutOut(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        solidBlock([batteryHousingW, batteryHousingL, batteryHousingH]);
    }
}

module solidBlock(dimensions){
    translate([0, 0, dimensions[2]/2])
        cube(dimensions, true);
}

module ctlrCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([microCtlrHousingW, microCtlrHousingL, microCtlrHousingH]);
        
        
    }
}

module boostCnvtr(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([cnvrtrHousingW, cnvrtrHousingL, cnvrtrHousingH]);
        
        
    }
}

module ledCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        //TBD - ledHousingH 
        solidBlock([ledBrdW, ledBrdL, ledHousingD]);

        
    }
}

module switchCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([switchHousingW, switchHousingL, switchHousingH]);
        
        
    }
}






