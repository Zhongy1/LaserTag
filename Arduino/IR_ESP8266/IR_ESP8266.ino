#include <Arduino.h>
#include <IRremoteESP8266.h>
#include <IRsend.h>

long outputSignal = 0x20DF10EF;
const uint16_t detectPin = D2;
const uint16_t sendPin = D1;
bool pressed = false;
bool alreadyPressed = false;

IRsend irsend(sendPin);

void setup() {
  Serial.begin(115200);
  delay(3000);
  //IR
  irsend.begin();
  pinMode(sendPin, OUTPUT);
  pinMode(detectPin, INPUT_PULLUP);
}

void loop() {
  pressed = digitalRead(detectPin);
  if (pressed && !alreadyPressed) {
    alreadyPressed = true;
    irsend.sendNEC(outputSignal);
    Serial.print("Current output signal in DEC: ");
    Serial.println(outputSignal);
  }
  else if (!pressed && alreadyPressed) {
    alreadyPressed = false;
  }
}
