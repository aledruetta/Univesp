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

bool DEBUG = false;

void setup_wifi(void);

WiFiClientSecure wifiClientSecure;
WiFiClient wifiClient;
PubSubClient pubSubClient;

long lastMsg = 0;

int cycles_on = 0;            // Contador de ciclos
int yellow_max = 3;           // Número de ciclos para pasar a amarelo
int red_max = 2 * yellow_max; // Número de ciclos para pasar a vermelho
int cycle_millis = 10 * 1000; // Segundos por ciclo

bool last_status = false,
     new_status = false;

String clientId;
String status = "verde";

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
 * Rotina para reconexão do cliente MQTT.
 */
void reconnect()
{
  while (!pubSubClient.connected())
  {
    clientId = WiFi.macAddress().substring(9, 17);
    clientId.replace(":", "");
    bool conectado = false;

    Serial.print("Tentando conectar com o broker MQTT... ");

    if (DEBUG)
      Serial.println(mqtt_server_debug);
    else
      Serial.println(mqtt_server);

    Serial.println("ClientId: " + clientId);

    conectado = pubSubClient.connect(clientId.c_str(), mqtt_user, mqtt_pass);

    if (conectado)
      Serial.println("conectado");
    else
    {
      Serial.print("erro, rc=");
      Serial.print(pubSubClient.state());
      Serial.println(" tentando de novo em 5 segundos");
      delay(5000);
    }
  }
}

/**
 * Lógica da leitura do sensor
 * A função retorna true se o fogão está acesso ou false no caso contrário
 */
bool readSensor()
{
  // implementar

  return true;
}

/**
 * Setup function
 */
void setup()
{
  Serial.begin(115200);
  setup_wifi();

  if (DEBUG)
  {
    pubSubClient.setClient(wifiClient);
    pubSubClient.setServer(mqtt_server_debug, 1883);
  }
  else
  {
    wifiClientSecure.setCACert(root_ca);
    pubSubClient.setClient(wifiClientSecure);
    pubSubClient.setServer(mqtt_server, 8883);
  }
}

/**
 * Main loop function
 */
void loop()
{
  if (!pubSubClient.connected())
  {
    reconnect();
  }
  pubSubClient.loop();

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
      status = "verde";
    }

    String topic = clientId + "/alarme";

    if (cycles_on > yellow_max && cycles_on <= red_max)
      status = "amarelo";
    else if (cycles_on > red_max)
      status = "vermelho";

    pubSubClient.publish(topic.c_str(), status.c_str());
    Serial.print("Tópico: " + topic);
    Serial.println(", Msg: " + status);
  }
}
