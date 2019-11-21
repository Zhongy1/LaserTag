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
            #ctlrCutout([-20, -10, gunPieceBotH], [-90, 0, 0]);
            #batteryCutOut([85, -38, gunPieceBotH - batteryHousingH + batteryHousingH / 2], [0, 0, -155]);
            #boostCnvtr([50, 10, gunPieceBotH - cnvrtrHousingH / 2], [0, 0, -90]);
            #switchCutout([49, -27, gunPieceBotH - switchHousingH / 2], [0, 0, -155]);
            #ledCutout([-70.5, 0, gunPieceBotH - ledBrdH / 2]);
            #ledLightCutout([-72.5, 0, gunPieceBotH - ledHousingW / 2]);
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
        for(i = [-1:2:1]){
            translate([0,i * (batteryHousingL + batteryContactsH) / 2, -(batteryContactsW - batteryHousingH) / 2])
                solidBlock([batteryContactsW, batteryContactsH, batteryContactsW]);
        }
        
    }
}

module solidBlock(dimensions){
    translate([0, 0, dimensions[2]/2])
        cube(dimensions, true);
}

module ctlrCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    ctlrRegionL = microCtlrHousingL - 6;
    legH = 3;
    brdT = circBrdT + 0.4;
    
    
    translate(offset) rotate(rotation){
        
        
        solidBlock([microCtlrHousingW, ctlrRegionL, microCtlrHousingH]);
        
        translate([0, 0, legH]){
            solidBlock([microCtlrHousingW, microCtlrHousingL, brdT]);
        }
        
        
    }
}

module boostCnvtr(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([cnvrtrHousingW, cnvrtrHousingL, cnvrtrHousingH]);
        
        
    }
}

module ledCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
         
        solidBlock([ledBrdW, ledBrdL, ledBrdH]);

        
    }
}

module ledLightCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
         
        solidBlock([ledHousingW, ledHousingW, ledHousingD - (ledHousingW * 2) ]);

        
    }
}

module switchCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([switchHousingW, switchHousingL, switchHousingH]);
        
        
    }
}






