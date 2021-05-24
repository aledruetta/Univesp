#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "secret.h"

void setup_wifi(void);
void callback(char* topic, byte* message, unsigned int length);

WiFiClientSecure wifiClient;
// const char* mqtt_server defined in secret.h
PubSubClient mqttClient(mqtt_server, 8883, callback, wifiClient);

long lastMsg = 0;
char msg[50];
int value = 0;

float temperature = 32;

void setup() {
  Serial.begin(115200);
  setup_wifi();

  // const char* cacert defined in secret.h
  // const char* client_cert defined in secret.h
  // const char* privkey defined in secret.h
  wifiClient.setCACert(cacert);
  wifiClient.setCertificate(client_cert);
  wifiClient.setPrivateKey(privkey);
}

void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  // const char* ssid defined in secret.h
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  // const char* password defined in secret.h
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void callback(char* topic, byte* message, unsigned int length) {
  Serial.print("Message arrived on topic: ");
  Serial.print(topic);
  Serial.print(". Message: ");
  String messageTemp;
  
  for (int i = 0; i < length; i++) {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();
}

void reconnect() {
  while (!mqttClient.connected()) {
    Serial.print("Attempting MQTT connection...");
    String clientId = "ESP32Client-";
    clientId += String(random(0xffff), HEX);

    // const char* mqtt_user defined in secret.h
    // const char* mqtt_pass defined in secret.h
    if (mqttClient.connect(clientId.c_str(), mqtt_user, mqtt_pass)) {
      Serial.println("connected");
    } else {
      Serial.print("failed, rc=");
      Serial.print(mqttClient.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}
void loop() {
  if (!mqttClient.connected()) {
    reconnect();
  }
  mqttClient.loop();

  long now = millis();
  if (now - lastMsg > 5000) {
    lastMsg = now;
    
    char tempString[8];
    dtostrf(temperature, 1, 2, tempString);
    Serial.print("Temperature: ");
    Serial.println(tempString);
    mqttClient.publish("esp32/temperature", tempString);
  }
}