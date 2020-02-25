#define triggerPin D0
unsigned long reloadingStart = 0;
unsigned long lastShot = 0;
unsigned long lastPressed = 0;
bool pressed = false;
bool alreadyPressed = false;
bool reloading = false;
bool doShooting = true;
int mag = 7;
int durationBeforeNextShot = 500;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(triggerPin, INPUT_PULLUP);
}

void reload(){
  reloadingStart = millis();
  reloading = true;
  mag = 7;
}

void loop() {
//  Serial.println(pressed);
  if(reloading && millis() >= reloadingStart+2000){
    reloading = false;
    doShooting = false;
  }
  
  if(millis() >= lastShot+durationBeforeNextShot && !reloading){
    pressed = !digitalRead(triggerPin);
    
    if(pressed && !alreadyPressed){
      alreadyPressed = true;
      lastPressed = millis();
    }
    
    else if(pressed && !reloading && millis() >= lastPressed+1500){
      Serial.println("Reloading new Mag!");
      reload();
    }
    
    else if(!pressed && alreadyPressed){
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
