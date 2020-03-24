#define triggerPin D0
class Trigger{
  
  private:
    bool canUse;
    unsigned long reloadingStart;
    unsigned long lastShot;
    unsigned long lastPressed;
    bool pressed;
    bool alreadyPressed;
    bool reloading;
    bool doShooting;
    int mag;
    int durationBeforeNextShot;
    
  public:
    Trigger(){
      canUse = true;
      reloadingStart = 0;
      lastShot = 0;
      lastPressed = 0;
      pressed = false;
      alreadyPressed = false;
      reloading = false;
      doShooting = true;
      mag = 7;
      durationBeforeNextShot = 500;
    }
    
    void enableTrigger(){
      canUse = true;
    }

    void disableTrigger(){
      canUse = false;
    }

    void reload(){
      reloadingStart = millis();
      reloading = true;
      mag = 7;
    }

    void looper(){
      bool reloaded = (reloading && millis() >= reloadingStart+2000);
      bool readyToShoot = (millis() >= lastShot+durationBeforeNextShot && !reloading);
      bool triggerPulled = (pressed && !alreadyPressed);
      bool reloading = (pressed && !reloading && millis() >= lastPressed+1500);
      bool shoot = (!pressed && alreadyPressed);
     
      if(reloaded){
        reloading = false;
        doShooting = false;
      }
      
      if(readyToShoot){
        pressed = !digitalRead(triggerPin);

        if(triggerPulled){
          alreadyPressed = true;
          lastPressed = millis();
        }
        else if(reloading){
          Serial.println("Reloading new Mag!");
          reload();
        }
        else if(shoot){
          mag = (!reloading && mag>0 && doShooting) ? mag-1: mag;
          if(doShooting){
            Serial.println("BANG!");
          }
          Serial.printf("Ammo in Mag: %d\n", mag);
          alreadyPressed = false;
          reloading = false;
          doShooting = true;
          lastShot = millis();
        }
    
      }
    }
    
};
