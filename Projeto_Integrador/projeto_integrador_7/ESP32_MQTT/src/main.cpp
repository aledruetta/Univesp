/* 
  # Essas constantes precisam estar definidas em um arquivo secret.h

  const char* mqtt_server = "domain.com"
  const char* root_ca = \
    "-----BEGIN CERTIFICATE-----\n" \
    "copiar aqui o certificado obtido pelo comando openssl\n" \
    "formatando cada linha como está em este modelo\n" \
    "-----END CERTIFICATE-----";
  const char* ssid = "identificador da rede wifi"
  const char* password = "senha da rede wifi"
  const char* mqtt_user = "usuário para autenticação no broker"
  const char* mqtt_pass = "senha para autenticação no broker"

  # Para obter o certificado SSL (copiar o segundo certificado)

  openssl s_client -connect domain.com:8883 -showcerts
*/

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "secret.h"

void setup_wifi(void);
void callback(char* topic, byte* message, unsigned int length);

WiFiClientSecure wifiClient;
PubSubClient mqttClient(mqtt_server, 8883, callback, wifiClient);

long lastMsg = 0;

void setup() {
  Serial.begin(115200);
  setup_wifi();
  wifiClient.setCACert(root_ca);
}

void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Conectando a ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);  // modo estação
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi conectado");
  Serial.print("Endereço IP: ");
  Serial.println(WiFi.localIP());
}

// O callback serve para receber mensagens.
// A gente por enquanto não usa.
void callback(char* topic, byte* message, unsigned int length) {
  Serial.print("Tópico da mensagem recebida: ");
  Serial.print(topic);
  Serial.print(". Mensagem: ");
  String messageTemp;
  
  for (int i = 0; i < length; i++) {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();
}

// Rotina para reconexão do cliente MQTT.
void reconnect() {
  while (!mqttClient.connected()) {
    Serial.print("Tentando conectar com o broker MQTT...");
    String clientId = "ESP32Client-";
    clientId += String(random(0xffff), HEX);

    if (mqttClient.connect(clientId.c_str(), mqtt_user, mqtt_pass)) {
      Serial.println("conectado");
    } else {
      Serial.print("erro, rc=");
      Serial.print(mqttClient.state());
      Serial.println(" tentando de novo em 5 segundos");
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
    
    // Publicando mensagem "Teste" para o tópico "esp32/test"
    Serial.println("Publicando...");
    mqttClient.publish("esp32/test", "Teste");
  }
}