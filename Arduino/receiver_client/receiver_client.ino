
/*
 * WebSocketClient.ino
 *
 *  Created on: 24.05.2015
 *
 */

#include <Arduino.h>

#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

#include <WebSocketsClient.h>
#include <IRremoteESP8266.h>
#include <IRrecv.h>
#include <IRutils.h>

ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

const uint16_t kRecvPin = D1;
IRrecv irrecv(kRecvPin);
decode_results results;

#define USE_SERIAL Serial
void sendHexToServer(String s){
  webSocket.sendTXT(s);
}
void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {

  switch(type) {
    case WStype_DISCONNECTED:
      USE_SERIAL.printf("[WSc] Disconnected!\n");
      break;
    case WStype_CONNECTED: {
      USE_SERIAL.printf("[WSc] Connected to url: %s\n", payload);

      // send message to server when Connected
      // webSocket.sendTXT("Connected");
    }
      break;
    case WStype_TEXT:
      USE_SERIAL.printf("[WSc] get text: %s\n", payload);

      // send message to server
      // webSocket.sendTXT("message here");
      break;
    case WStype_BIN:
      USE_SERIAL.printf("[WSc] get binary length: %u\n", length);
      hexdump(payload, length);

      // send data to server
      // webSocket.sendBIN(payload, length);
      break;
  }

}

void setup() {
  Serial.begin(115200);
  delay(3000);
  WiFiMulti.addAP("LugBuild", "esp8266testing");
  while(WiFiMulti.run() != WL_CONNECTED) {
    delay(100);
  }
  Serial.println("Local IP: " + WiFi.localIP());
  webSocket.begin("10.107.208.53", 8080, "/");
  webSocket.onEvent(webSocketEvent);
  webSocket.setReconnectInterval(5000);

  irrecv.enableIRIn();
}
int timer = millis();
int curTimer = 0;
void loop() {
  webSocket.loop();

  if (millis() > timer+200 && irrecv.decode(&results)) {
    // print() & println() can't handle printing long longs. (uint64_t)
    //serialPrintUint64(results.value, HEX);
    //Serial.println("");
    String code = String((long)results.value, HEX);
    webSocket.sendTXT("/setoutput " + code);
    Serial.println("/setoutput " + code);
    irrecv.resume();  // Receive the next value
    timer = millis();
  }
}
