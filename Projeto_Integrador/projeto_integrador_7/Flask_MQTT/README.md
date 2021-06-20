# UNIVESP - Projeto Integrador VII

## ESP32 MQTT Client

[[Código fonte](https://github.com/aledruetta/Univesp/tree/master/Projeto_Integrador/projeto_integrador_7/ESP32_MQTT)]

Inicializar a constante `DEBUG` com valor `true` para desenvolvimento local sem TLS, ou valor `false` para comunicação segura com o broker remoto.

Para obter o certificado SSL (copiar o segundo certificado em `root_ca`)

```bash
openssl s_client -connect example.com:8883 -showcerts
```

As seguintes constantes precisam estar definidas em um arquivo `include/secret.h`

```cpp
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
```

Comando para testar o broker

Instalar cliente Mosquitto e executar:

```bash
# Adicionar usuário e senha
sudo mosquitto_passwd -c /etc/mosquitto/passwd mqtt_user

mosquitto_sub -h example.com -t esp32/test \
    -p 8883 --capath /etc/ssl/ \
    certs/ -u "mqtt_user" -P "mqtt_pass"
```

## Flask MQTT WebApp

[[Código fonte](https://github.com/aledruetta/Univesp/tree/master/Projeto_Integrador/projeto_integrador_7/Flask_MQTT/webapp)]

Definir variável de ambiente `FLASK_ENV` para produção ou desenvolvimento:

```bash
export FLASK_ENV=development            # local sem TLS
export FLASK_ENV=production             # conexão segura broker remoto
```

Executar:

```bash
make run
```

Vagrant:

```bash
cd webapp
vagrant up
```

### Referências

- [DigitalOcean - Initial Server Setup with Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)
- [DigitalOcean - How to use Certbot standalone mode to retrieve Letsencrypt certificates on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-certbot-standalone-mode-to-retrieve-let-s-encrypt-ssl-certificates-on-ubuntu-1804)
- [DigitalOcean - How to install and secure the Mosquitto MQTT messaging broker on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-the-mosquitto-mqtt-messaging-broker-on-ubuntu-18-04)
- [Knolleary - PubSubClient API](https://pubsubclient.knolleary.net/api)
- [Random Nerd Tutorials - What is MQTT and how it works](https://randomnerdtutorials.com/what-is-mqtt-and-how-it-works/)
- [Random Nerd Tutorials - ESP32 useful WiFi functions](https://randomnerdtutorials.com/esp32-useful-wi-fi-functions-arduino)
- [Random Nerd Tutorials - ESP32 MQTT publish subscribe](https://randomnerdtutorials.com/esp32-mqtt-publish-subscribe-arduino-ide/)
