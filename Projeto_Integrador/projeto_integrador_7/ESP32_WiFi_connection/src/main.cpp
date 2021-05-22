#include <Arduino.h>
#include <WiFi.h>
#include "secret.h"

void initWifi() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.print("Connecting to WiFi ..");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
  Serial.println(WiFi.localIP());
}

void setup() {
  Serial.begin(115200);
  initWifi();
  Serial.print("RRSI: ");
  Serial.println(WiFi.RSSI());
}

void loop() {
  delay(1000);
  Serial.println(WiFi.status());
}