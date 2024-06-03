- • Ejecución.
  • Shebang.
  • Función de ayuda.
  • Captura de parámetros.
  • Validación.
  • Repositorios e instalación.
  • Configuración.
  • Creación del usuario por defecto.
  • Comprobación.
- Ejecución
  bash install.sh -u usuario -p password -n puerto
  bash install.sh -u ubuntu -p ubuntu_pass -n 27017
  Shebang
  #!/bin/bash
  set -e #con este comando se sale del script si cualquiera de los comandos falla. De esta forma nos
  aseguramos que no va a haber instalaciones incompletas.
-
- Captura de comandos
  Los parámetros están normalmente
  disponibles en las variables $1, $2, $3,
  etc., o en el array $@.
  El comando getopts de Bash: para
  cada elemento de ":u:p:n:h", getopts
  guarda el valor del parámetro en la
  variable opcION. Entonces, la expresión
  case facilita la ejecución de unas líneas
  de código para cada valor de OPCION.
  Es equivalente a una estructura if-
  else, pero más fácil de leer.
  while getopts ":u:p:n:h" OPCION
  do
  case ${OPCION} in
  u ) USUARIO=$OPTARG
  echo "Parametro USUARIO establecido con '${USUARIO}'"; ;
  p ) PASSWORD=$OPTARG
  echo "Parametro PASSWORD establecido"; ;
  n ) PUERTO_MONGOD=$OPTARG
  echo "Parametro PUERTO_MONGOD establecido con
  '${PUERTO_MONGOD}"" ;;
  h) ayuda; exit 0;3
  : ) ayuda "Falta el parametro para -$OPTARG"; exit 1; ;
  \?) ayuda "La opcion no existe : $OPTARG"; exit 1;;
  esac
  done
  - ### Validación
  Si el usuario o la contraseña no están
  definidos, imprime un mensaje de
  error y sale con un código de salida
  diferente de 0.
  Si el puerto no está definido, lo fija a
  un valor por defecto de 27017.
  if [ -z $(USUARIO} ]
  then
  ayuda "El usuario (-u) debe ser especificado"; exit 1
  1f [ -Z $(PASSWORD} ]
  then
  ayuda "La password (-p) debe ser especificada"; exit 1
  fi
  1f [ -Z $ (PUERTO_MONGOD} ]
  then
  fi
  PUERTO_MONGOD=27017
-
-
- ### Repositorios e instalación
  Se trata de instalar la última versión
  disponible (añadiendo el apt oficial de
  MongoDB).
  Después se instalan en servidor y las
  herramientas de línea de comandos
  (únicamente si el servidor no está ya
  instalado).
  Sirve para encadenar comandos
  juntos. Solo se ejecuta si no ha habido
  errores en el comando anterior.
  if [[ -z "$(mongo --version 2> /dev/null | grep '4.2.1')" ]]
  then
- ##### Instalar paquetes comunes, servidor, shell, balanceador de shards y herramientas
- apt-get -y update \
  && apt-get install -y \
  mongodb-org=4.2.1 \
  mongodb-org-server=4.2.1 \
  mongodb-org-shell=4.2.1 \
  mongodb-org-mongos=4.2.1 \
  mongodb-org-tools=4.2.1 \
  && rm -rf /var/lib/apt/lists/* \
  && pkill -u mongodb || true \
  && pkill -f mongod | true \
  && rm -rf /var/lib/mongodb
  fi
-
- #### Configuración
  Ahora se van a configurar los
  directorios para alojar los archivos
  de la BD y los logs.
- Crear las carpetas de logs y datos con sus permisos
  [[ -d "/datos/bd" ]] || mkdir -p -m 755 "/datos/bd"
  [[ -d "/datos/log" ]] || mkdir -p -m 755 "/datos/log"
- Establecer el dueño y el grupo de las carpetas db y 10g
  chown mongodb /datos/log /datos/bd
  chgrp mongodb /datos/log /datos/bd
-
- #### Configuración
  En general, la configuración de
  software se realiza a traves de un
  fichero de configuración.
-
- <ins>HEREDOCS</ins>
- ###### Fichero de configuración de MongoDB
  (
  cat <<MONGOD_CONF
- /etc/mongod.conf
  systemLog:
  destination: file
  path: /datos/log/mongod.log
  logAppend: true
  storage:
  dbPath: /datos/bd
  engine: wiredTiger
  journal:
  enabled: true
  net:
  port: ${PUERTO_ MONGOD}
  security:
  authorization: enabled
  MONGOD_CONF
  ) › /etc/mongod.conf
-
- Creación del usuario por defecto
  Se utiliza la consola de MongoDB,
  llamada mongo.
  Valores de entorno
- Crear usuario con la password proporcionada como parametro
- mongo admin «< CREACION_DE_USUARIO
  db createUser((
  user: "${USUARIO}",
  pwd: "${PASSWORD}"
  roles: K
  role: "root",
  db: "admin"
  },f
  role: "restore",
  db: "admin"
  3] })
  <ins>CREACION_DE_USUARIO</ins>