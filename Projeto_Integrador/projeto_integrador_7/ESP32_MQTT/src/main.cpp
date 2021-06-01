/** 
 * UNIVESP - Projeto Integrador VII
 * Cliente MQTT ESP32
 * 
 * Consultar o arquivo README do projeto.
 */

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "secret.h"

void setup_wifi(void);
void callback(char *topic, byte *message, unsigned int length);

WiFiClientSecure wifiClientSecure;
WiFiClient wifiClient;
PubSubClient mqttClient;

long lastMsg = 0;

int cycles_on = 0;
int yellow_max = 2;
int red_max = 2 * yellow_max;
int cycle_millis = 10000;

bool last_status = false,
     new_status = false;

String clientId;
String status = "Green";

/**
 * Setup_wifi function
 */
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
  Serial.print("Endereço MAC: ");
  Serial.println(WiFi.macAddress());
}

/**
 * callback function
 * 
 * O callback serve para receber mensagens.
 * A gente por enquanto não usa.
 */
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

/**
 * Rotina para reconexão do cliente MQTT.
 */
void reconnect()
{
  while (!mqttClient.connected())
  {
    clientId = "esp32-" + WiFi.macAddress().substring(9, 17);
    bool conectado = false;

    Serial.println("Tentando conectar com o broker MQTT...");
    Serial.println("ClientId: " + clientId);

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

bool readSensor()
{
  // aqui vai a lógica da leitura do sensor
  // a função retorna true se o fogão está acesso ou false no caso contrário

  return true;
}

void setup()
{
  Serial.begin(115200);
  setup_wifi();
  wifiClientSecure.setCACert(root_ca);
  mqttClient.setCallback(callback);
  mqttClient.setClient(wifiClientSecure);
  mqttClient.setServer(mqtt_server, 8883);
}

void loop()
{
  if (!mqttClient.connected())
  {
    reconnect();
  }
  mqttClient.loop();

  long now = millis();

  if (now - lastMsg > cycle_millis)
  {
    lastMsg = now;
    last_status = new_status;

    new_status = readSensor();

    if (new_status && last_status)
      cycles_on++;
    else
    {
      cycles_on = 0;
      status = "Green";
    }

    String topic = clientId + "/alarme";

    if (cycles_on > yellow_max && cycles_on <= red_max)
      status = "Yellow";
    else if (cycles_on > red_max)
      status = "Red";

    mqttClient.publish(topic.c_str(), status.c_str());
    Serial.println("Publicando topic: " + topic);
    Serial.print("Cycles: ");
    Serial.print(cycles_on);
    Serial.println(", Status: " + status);
  }
}
