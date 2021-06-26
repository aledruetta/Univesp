/** 
 * UNIVESP - Projeto Integrador VII
 * Cliente MQTT ESP32
 * 
 * Consultar o arquivo README do projeto.
 */

#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "secret_2.h"

int LEDVM = 22; //led falha na conexão wifi
int LEDVD = 21; // led sucesso conexão mqtt
int LEDAZ = 19; // led sucesso conexão wifi
int BZ = 23; // buzzer de alarme da placa
int SENSOR = 5; // sensor de chama


void setup_wifi(void);
void callback(char *topic, byte *message, unsigned int length);

WiFiClientSecure wifiClientSecure;
WiFiClient wifiClient;
PubSubClient mqttClient;

long lastMsg = 0;

int cycles_on = 0;
int yellow_max = 2;
int red_max = 2 * yellow_max;
int cycle_millis = 10000; // 10 segundos
int wifi_cycles = 0;
int pin_sensor  = 0;

bool fogo_det = false;


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
    digitalWrite(LEDAZ, 0);
    digitalWrite(LEDVM, 1);
    delay(500);
    Serial.print(".");
    digitalWrite(LEDVM, 0);
    delay(500);
    wifi_cycles++;
    if (wifi_cycles == 10)
    {
      Serial.println("Falha na conexao wifi");
      Serial.println(WL_IDLE_STATUS);
      wifi_cycles = 0;
    }
  }

  Serial.println("");
  Serial.println("WiFi conectado");
  Serial.print("Endereço IP: ");
  Serial.println(WiFi.localIP());
  Serial.print("Endereço MAC: ");
  Serial.println(WiFi.macAddress());
  digitalWrite(LEDVM, 0);
  digitalWrite(LEDAZ, 1);
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
void reconnectMqtt()
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
      Serial.println("Broker MQTT conectado");
      digitalWrite(LEDVD, 1);
    }
    else
    {
      digitalWrite(LEDVD, 0);
      Serial.print("erro, rc=");
      Serial.print(mqttClient.state());
      Serial.println(" Perda de conexao MQTT. Tentando de novo em 5 segundos");
      delay(2500);
      digitalWrite(LEDVD, 1);
      delay(2500);
    }
  }
}

void reconnectWifi()
{
  Serial.println("");
  Serial.println("Perda de conexão WiFi");
  digitalWrite (LEDAZ, 0);
  WiFi.reconnect();

  while (WiFi.status() != WL_CONNECTED)
  {
    digitalWrite(LEDAZ, 0);
    digitalWrite(LEDVM, 1);
    delay(500);
    Serial.print("Tentando reconexão WiFi");
    digitalWrite(LEDVM, 0);
    delay(500);
    wifi_cycles++;
    if (wifi_cycles == 10)
    {
      Serial.println("Falha na conexão wifi");
      Serial.println(WL_IDLE_STATUS);
      wifi_cycles = 0;
    }
  }
  Serial.println("Reconectado ao WiFi");
  digitalWrite (LEDAZ , 1);
  digitalWrite (LEDVM, 0);
}

/**
 * Lógica da leitura do sensor
 * A função retorna true se o fogão está acesso ou false no caso contrário
 */
void readSensor()
{
  pin_sensor = digitalRead(SENSOR);
  if (pin_sensor == 0)
  {
    Serial.println("pino 5 = 0");
    fogo_det=true;
  }
  else
  {
    fogo_det=false;
  }
}
/**
 * rotinas para acionar o buzzer
*/
void Um_Beep()
{
  digitalWrite(23, HIGH);
  delay(1000);
  digitalWrite (23, LOW);
  delay(1000);
}
void Flash_Beep()
{
  digitalWrite(23, HIGH);
  delay (300);
  digitalWrite (23, LOW);
  delay (300);
  digitalWrite(23, HIGH);
  delay (300);
  digitalWrite (23, LOW);
  delay (300);
}
/**
 * Setup function
 */
void setup()
{
  pinMode(LEDVM, OUTPUT);
  pinMode(LEDVD, OUTPUT);
  pinMode(LEDAZ, OUTPUT);
  pinMode(BZ, OUTPUT);
  pinMode(SENSOR, INPUT);

  /** 
  * testar todas as saídas
  */
  digitalWrite(LEDVM, 1);
  digitalWrite(LEDVD, 1);
  digitalWrite(LEDAZ, 1);
  digitalWrite(BZ, 1);
  delay(1500);
  digitalWrite(LEDVM, 0);
  digitalWrite(LEDVD, 0);
  digitalWrite(LEDAZ, 0);
  digitalWrite(BZ, 0);

  Serial.begin(115200);
  setup_wifi();
  wifiClientSecure.setCACert(root_ca);
  mqttClient.setCallback(callback);
  mqttClient.setClient(wifiClientSecure);
  mqttClient.setServer(mqtt_server, 8883);
}

/**
 * Main loop function
 */
void loop()
{
  if (!mqttClient.connected())
  {
    reconnectMqtt();
  }
  mqttClient.loop();
  if(WiFi.status() != WL_CONNECTED)
  {
    reconnectWifi();
  }

  long now = millis();

  if (now - lastMsg > cycle_millis)
  {
    lastMsg = now;

    readSensor();    
    if ((fogo_det) == true)
    {
      Serial.println("");
      Serial.println("Fogao com chama acesa.");
      cycles_on++;
    }
    else
    {
      Serial.println("Nao ha chama.");
      cycles_on = 0;
      status = "verde";
    }

    String topic = clientId + "/alarme";

    if (cycles_on > yellow_max && cycles_on <= red_max)
    {
      Um_Beep();
      status = "amarelo";
    }
    else if (cycles_on > red_max)
    {
      Flash_Beep();
      status = "vermelho";
    }

    mqttClient.publish(topic.c_str(), status.c_str());
    Serial.println("Publicando topic: " + topic);
    Serial.print("Cycles: ");
    Serial.print(cycles_on);
    Serial.println(", Status: " + status);
  }
}