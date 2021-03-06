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
            #batteryCutOut([80, -30, gunPieceBotH - batteryHousingH + batteryHousingH / 2], [0, 0, -155]);
            #boostCnvtr([35, 15, gunPieceBotH - cnvrtrHousingH / 2], [0, 0, -90]);
            #switchCutout([49, -27, gunPieceBotH - switchHousingH / 2], [0, 0, -155]);
            #ledCutout([-75, 0, gunPieceBotH]);
           
            wirePathW = 5;
            //led to micro controller wire path
            #translate([-48, 0, gunPieceBotH - microCtlrHousingL / 2]){
                solidBlock([7, wirePathW, microCtlrHousingL]);
            }
            //boost converter wire path
            #translate([12, 9, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, 45]){
                solidBlock([22, wirePathW, microCtlrHousingL]);
            }
            //switch wire paths
            #translate([20, -13, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, -15]){
                solidBlock([42, wirePathW, microCtlrHousingL]);
            }
            //battery wire paths
            #translate([60, 5, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, -35]){
                solidBlock([35, wirePathW-2, microCtlrHousingL]);
            }  
            #translate([66, 15, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, -10]){
                solidBlock([25, wirePathW-2, microCtlrHousingL]);
            }
            #translate([94, -23, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, -65]){
                solidBlock([82, wirePathW-2, microCtlrHousingL]);
            }
            #translate([105, -64, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, 25]){
                solidBlock([18, wirePathW-2, microCtlrHousingL]);
            }
            #translate([96, -64, gunPieceBotH - microCtlrHousingL / 2])rotate([0, 0, -65]){
                solidBlock([10, wirePathW-2, microCtlrHousingL]);
            }
               
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
    compRegionW = 12;
    compRegionL = ledBrdL - 4;
    translate(offset) rotate(rotation){
        
        
        translate([ledHousingW/2, 0, -ledHousingD/2])
            solidBlock([ledHousingW, ledHousingD, ledHousingD]); 
        
        translate([ledBrdW/2 + ledHousingW, 0, -ledBrdH/2])
            solidBlock([ledBrdW, ledBrdL, ledBrdH]);
        
        translate([ledHousingW + ledBrdW + (compRegionW/2), 0, -ledBrdH/2])
            solidBlock([compRegionW, compRegionL, ledBrdH]);

        
    }
}

/*
module ledLightCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
         
        solidBlock([ledHousingD, ledHousingW, ledBrdH - (ledHousingW * 2) ]);

        
    }
}
*/

module switchCutout(offset = [0, 0, 0], rotation = [0, 0, 0]){
    translate(offset) rotate(rotation){
        
        
        solidBlock([switchHousingW, switchHousingL, switchHousingH]);
        
        
    }
}






