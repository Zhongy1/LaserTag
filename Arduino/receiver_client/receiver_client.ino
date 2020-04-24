#include <Arduino.h>

#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

#include <WebSocketsClient.h>
#include <IRremoteESP8266.h>
#include <IRrecv.h>
#include <IRutils.h>

ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

#define SSID "LugBuild"
#define password "esp8266testing"

String ID = "S01";

#define serverIP "10.21.209.70"
#define port 8080

bool isDead = false;

const uint16_t kRecvPin = D1;
IRrecv irrecv(kRecvPin);
decode_results results;

void sendHexToServer(String s){
  webSocket.sendTXT(s);
}
void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {

  switch(type) {
    case WStype_DISCONNECTED:
      Serial.printf("[WSc] Disconnected!\n");
      break;
    case WStype_CONNECTED: {
      Serial.printf("[WSc] Connected to url: %s\n", payload);
      webSocket.sendTXT("/connect " + ID);
    }
      break;
    case WStype_TEXT:
      Serial.printf("[WSc] get text: %s\n", payload);
      handleServerCmds(payload);
      break;
  }

}

bool checkValidID(String id) {
  if (id.length() != 3) return false;
  if (id[0] != 'B') return false;
  return true;
}

void handleServerCmds(uint8_t * payload) {
  if (strcmp((const char *)payload, "/killthis")) {
    isDead = true;
  }
  else if (strcmp((const char *)payload, "/reset")) {
    isDead = false;
  }
}

void setup() {
  Serial.begin(115200);
  delay(3000);
  WiFiMulti.addAP(SSID, password);
  while(WiFiMulti.run() != WL_CONNECTED) {
    delay(100);
  }
  Serial.println("Local IP: " + WiFi.localIP());
  webSocket.begin(serverIP, port, "/");
  webSocket.onEvent(webSocketEvent);
  webSocket.setReconnectInterval(5000);

  irrecv.enableIRIn();
}


int lastCheck = millis();
void loop() {
  webSocket.loop();

  if (!isDead && millis() > lastCheck+200 && irrecv.decode(&results)) {
    String code = String((long)results.value, HEX);
    if (checkValidID(code)) {
      webSocket.sendTXT("/attack " + code + " " + ID);
      Serial.println("/attack " + code + " " + ID);
    }
    irrecv.resume();
    lastCheck = millis();
  }
}


