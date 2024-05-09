- Comprobación
  Se trata de detectar en qué plataforma
  se va a ejecutar, ya que la instalación de
  paquetes y la configuración del sistema
  podrían variar de una distribución a otra.
  Se puede escribir para que «se adapte»
  dependiendo de la plataforma o para
  que termine en error si no es la
  plataforma que espera.
  Si no es una distribución basada en
  RedHat, el script asume que se está
  ejecutando en una distribución Ubuntu
  18.
  if [[-e /etc/redhat-release || -e /etc/system-release ]]
  then
- <ins>Solo se soporta la instalacion en la release 7 de RedHat y Centos</ins>
- 0S=$(rpm -q --whatprovides redhat-release | cut -d"-" -f1)
  RELEASE=$(rpm -q --whatprovides redhat-release | cut -d"-" -f3)
  if [[ "${0S}" |= "centos" && "${0S}" |= "redhat" ]]
  then
      logger "La instalacion solo esta soportada en RedHat y CentOS"
      exit 2
  fi
  then
  if [[ "${RELEASE}" |= "7" ]]
     logger "La instalacion solo esta soportada en CentoS y RedHat
  release 7"
      exit 3
  else
  fi
- #... prosigue la instalación en RedHat y Centos
- #... prosigue la instalación en Ubuntu
- fi
- ##### Instalación de CentOS
  Configurar repositorios, instalación de paquetes, configurar
  y arrancar servicios. La principal diferencia es que el gestor
  de paquetes es yum en vez de apt-get.
  Comprobación
  El fichero info.php, creado por el script, contiene la función
  phpinfo() de PHP, que imprime una larga lista de
  opciones de instalación y módulos en ejecución. Si se
  recupera el fichero con un navegador y se obtiene un fichero
  de texto plano con el contenido ‹ ?php phpinfo(); ?>, la
  instalación no ha funcionado. Sin embargo, si se obtiene una
  página como esta, la instalación terminó con éxito.