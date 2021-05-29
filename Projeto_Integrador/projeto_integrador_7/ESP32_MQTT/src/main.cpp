/** 
  # Essas constantes precisam estar definidas em um arquivo secret.h

    const char* mqtt_server = "example.com"
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

    openssl s_client -connect example.com:8883 -showcerts

  # Comando para testar o broker

    Instalar cliente Mosquitto e executar:

    mosquitto_sub -h example.com -t esp32/test -p 8883 --capath /etc/ssl/certs/ -u "mqtt_user" -P "mqtt_pass"

  # Liks usados para consulta:

    https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04
    https://www.digitalocean.com/community/tutorials/how-to-use-certbot-standalone-mode-to-retrieve-let-s-encrypt-ssl-certificates-on-ubuntu-1804
    https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-the-mosquitto-mqtt-messaging-broker-on-ubuntu-18-04
    https://pubsubclient.knolleary.net/api
    https://github.com/knolleary/pubsubclient/blob/master/examples/mqtt_esp8266/mqtt_esp8266.ino
    https://randomnerdtutorials.com/what-is-mqtt-and-how-it-works/
    https://randomnerdtutorials.com/esp32-useful-wi-fi-functions-arduino
    https://randomnerdtutorials.com/esp32-mqtt-publish-subscribe-arduino-ide/
*/

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "secret.h"

const bool DEBUG = true;

void setup_wifi(void);
void callback(char *topic, byte *message, unsigned int length);

WiFiClientSecure wifiClientSecure;
WiFiClient wifiClient;
PubSubClient mqttClient;

long lastMsg = 0;

void setup()
{
  Serial.begin(115200);
  setup_wifi();
  wifiClientSecure.setCACert(root_ca);
  mqttClient.setCallback(callback);

  if (DEBUG)
  {
    mqttClient.setClient(wifiClient);
    mqttClient.setServer("192.168.0.100", 1883);
  }
  else
  {
    mqttClient.setClient(wifiClientSecure);
    mqttClient.setServer(mqtt_server, 8883);
  }
}

void setup_wifi()
{
  delay(10);
  Serial.println();
  Serial.print("Conectando a ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA); // modo estação
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED)
  {
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
void callback(char *topic, byte *message, unsigned int length)
{
  Serial.print("Tópico da mensagem recebida: ");
  Serial.print(topic);
  Serial.print(". Mensagem: ");
  String messageTemp;

  for (int i = 0; i < length; i++)
  {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();
}

// Rotina para reconexão do cliente MQTT.
void reconnect()
{
  while (!mqttClient.connected())
  {
    Serial.print("Tentando conectar com o broker MQTT...");
    String clientId = "ESP32Client-";
    clientId += String(random(0xffff), HEX);

    bool conectado = false;

    if (DEBUG)
      conectado = mqttClient.connect(clientId.c_str(), "test", "test");
    else
      conectado = mqttClient.connect(clientId.c_str(), mqtt_user, mqtt_pass);

    if (conectado)
    {
      Serial.println("conectado");
    }
    else
    {
      Serial.print("erro, rc=");
      Serial.print(mqttClient.state());
      Serial.println(" tentando de novo em 5 segundos");
      delay(5000);
    }
  }
}

void loop()
{
  if (!mqttClient.connected())
  {
    reconnect();
  }
  mqttClient.loop();

  long now = millis();
  if (now - lastMsg > 5000)
  {
    lastMsg = now;

    // Publicando mensagem "Teste" para o tópico "esp32/test"
    Serial.println("Publicando...");
    mqttClient.publish("esp32/test", "Teste");
  }
}