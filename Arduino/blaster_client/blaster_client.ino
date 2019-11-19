#include <Arduino.h>
#include <IRremoteESP8266.h>
#include <IRsend.h>

#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <WebSocketsClient.h>

enum Cmdtype{
  Invalid,
  SetID,
  SetOutput,
  GetID,
  GetOutput
};

ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

uint8_t* ID = (uint8_t *)malloc(1);
long outputSignal = 0;
long data = 0x20DF10EF;
const uint16_t detectPin = D2;
const uint16_t sendPin = D1;
bool pressed = false;
bool alreadyPressed = false;

IRsend irsend(sendPin);

void setup() {
  Serial.begin(115200);
  delay(3000);
  //Server Connection
  WiFiMulti.addAP("LugBuild", "esp8266testing");
  while(WiFiMulti.run() != WL_CONNECTED) {
    delay(100);
  }
  Serial.println("Local IP: " + WiFi.localIP());
  webSocket.begin("10.21.211.182", 8080, "/");    //IP should be changed accordingly
  webSocket.onEvent(webSocketEvent);
  webSocket.setReconnectInterval(5000);
  
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

  webSocket.loop();
}

/*
 * Payload format:
 * [2 Digit Code][String]
 * Example:
 * "00This is sent from server"
 */
void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {
  
  switch(type) {
    case WStype_DISCONNECTED:
      Serial.printf("[Server] Disconnected\n");
      break;
    case WStype_CONNECTED:
      Serial.printf("[Server] Connected\n");
      webSocket.sendTXT("/getoutput");
      break;
    case WStype_TEXT:
      Serial.print("[Debug] Payload length: ");
      Serial.println(length);
      if (length < 3) break;
      switch(extractType(&payload)) {
        length -= 2;
        case SetID:
          Serial.printf("[SetID] New ID: %s\n", payload);
          free(ID);
          ID = (uint8_t *)malloc(length);
          strcopy(ID, payload);
          break;
        case SetOutput:
          Serial.printf("[SetOutput] New Output: %s\n", payload);
          outputSignal = hexStringToNum(payload);
          break;
        case GetID:
          Serial.printf("[GetID] Sent ID to Server: %s\n", ID);
          webSocket.sendTXT(ID);
          break;
        case GetOutput: {
            String outStr = String(outputSignal, HEX);
            Serial.printf("[GetOutput] Sent Output Signal to Server: %s\n", outStr.c_str());
            webSocket.sendTXT(outStr);
          }
          break;
        default:
          Serial.printf("[From-Server] Message: %s\n", payload);
          break;
      }
      break;
  }

}

/*
 * Get code and shift pointer to start of string
 */
Cmdtype extractType(uint8_t ** str) {
  char strCode[2]; 
  for (int i = 0; i < 2; i++) {
    strCode[i] = (*str)[i];
  }
  *str = *str + 2;
  return (Cmdtype)atoi(strCode);
}

long hexStringToNum(uint8_t * hex) {
  long num = 0;
  int i = 0;
  while (hex[i] != '\0') {
    char c = hex[i];
    if (c >= 48 && c <= 57) {
      num = (num << 4) + (c - 48);
    }
    else if (c >= 65 && c <= 70) {
      num = (num << 4) + (c - 55);
    }
    else if (c >= 97 && c <= 102) {
      num = (num << 4) + (c - 87);
    }
    i++;
  }
  return num;
}

void strcopy(uint8_t* str, uint8_t* input) {
  int i = 0;
  while(input[i] != '\0') {
    str[i] = input[i];
    i++;
  }
}

