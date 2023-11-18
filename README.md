# Proyecto

## Correr con Docker

1. Clona este repositorio en tu computador.

2. Crea un archivo `.env` en la raíz del proyecto (con los valores correspondientes, los puestos son de ejemplo):

```
FULL_CHAIN_PEM="-----BEGIN CERTIFICATE-----\n45"
PRIV_KEY_PEM="-----BEGIN PRIVATE KEY-----\n45"
NGINX_PROXY_PASS=10.128.0.05:8000
```

**Nota:** para las dos variables PEM, se deben guardar los valores siguiendo el siguiente procedimiento: [https://stackoverflow.com/a/74624373](https://stackoverflow.com/a/74624373)

3. Ejecuta el siguiente comando para construir la imagen, ubicado en la raíz del proyecto.

`sudo docker build . --tag nginx-ssl`

4. Ejecuta el siguiente comando correr el proyecto en localhost.

`sudo docker run -d --name nginx -p 80:80 -p 443:443 nginx-ssl`