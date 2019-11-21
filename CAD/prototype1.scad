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
            #ledCutout([-75, 0, gunPieceBotH]);
           
            /* wire path 
            translate([0, 0, 0]){
                solidBlock([0, 0, microCtlrHousingH]);
            }
            translate([0, 0, 0]){
                solidBlock([0, 0, microCtlrHousingH]);
            }
            translate([0, 0, 0]){
                solidBlock([0, 0, microCtlrHousingH]);
            }
            translate([0, 0, 0]){
                solidBlock([0, 0, microCtlrHousingH]);
            }
            translate([0, 0, 0]){
                solidBlock([0, 0, microCtlrHousingH]);
            }
            translate([0, 0, 0]){
                solidBlock([0, 0, microCtlrHousingH]);
            }
            */    
            
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






