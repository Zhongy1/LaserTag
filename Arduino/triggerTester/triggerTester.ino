#define triggerPin D0
unsigned long lastPressed = 0;
bool pressed = false;
bool alreadyPressed = false;
bool reloading = false;
int mag = 7;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(triggerPin, INPUT_PULLUP);
}

void reload(){
  reloading = true;
  mag = 7;
  delay(1500);
}

void loop() {
  pressed = !digitalRead(triggerPin);
  if(pressed && !alreadyPressed){
    Serial.println("Pressed");
    alreadyPressed = true;
    lastPressed = millis();
  }
  else if(pressed && !reloading && millis() >= lastPressed+1500){
    Serial.println("Reloading");
    reload();
  }
  else if(!pressed && alreadyPressed){
    mag = (!reloading && mag>0) ? mag-1: mag;
    Serial.printf("Mag: %d\n", mag);
    alreadyPressed = false;
    reloading = false;
  }
}
