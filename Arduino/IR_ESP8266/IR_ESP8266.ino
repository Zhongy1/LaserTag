#include <Arduino.h>
#include <IRremoteESP8266.h>
#include <IRsend.h>

const uint16_t sendPin = 1;
bool switchFlag = false;

IRsend irsend(sendPin);

void setup() {
  irsend.begin();

  attachInterrupt(digitalPinToInterrupt(sendPin), triggerPull, HIGH);
}

void loop() {
  if(switchFlag){
    //send to transistor
    //TODO add in an actual LG signal
    Serial.println("NEC");
    irsend.sendNEC(data, bits)
    switchFlag = false;

    //add in trigger delay? corrispond to rate of fire
  }
  delay(10);
}

void triggerPull(){
  switchFlag = true;
}

void emitHex(long int input){
  
}
