## Software framework
• Simplificar y reducir el tiempo de desarrollo, permitiendo a los desarrolladores centrarse en el
desarrollo específico que cumpla con los requisitos necesarios, sin tener que preocuparse de
elementos y servicios de uso común que son proporcionados por el framework, y lograr así
una entrega más rápida.
• Suelen ofrecernos además un conjunto común de convenciones, procedimientos y servicios
que tienen como objetivo fomentar que el equipo desarrolle de forma homogénea.
• Chef: lenguaje específico de dominio (DSL) basado en Ruby, proporcionando una capa de
abstracción sobre los recursos.
-
- ## Historia de Chef
  • Adam Jacob (2009).
  • Originalmente «Marionette».
  • Siempre comparado con Puppet.
  • Ruby.
-
- ## Componentes Chef
  • Servidor Chef: constituye el centro de los datos de configuración, conteniendo los cookbooks,
  que son los módulos de configuración de recursos, las políticas que se aplicarán a los diferentes
  nodos, y los metadatos, que describen cada uno de los nodos administrados por Chef.
  • Nodos: usan la herramienta Chef Client para conectarse al servidor y solicitar los detalles de la
  configuración. A este proceso se le denomina <ins>chef run.</ins> 
  • Rol: conjunto de atributos y una lista de recetas para el nodo.
  • Un nodo puede tener varios roles y un conjunto de nodos el mismo rol.
  • Lista de ejecución: lista de recetas asociadas con un nodo a través del rol.
- ## Componentes Chef
  • Chef Workstation (o Chef-repo):
  • Contiene la estructura del proyecto gestionado por Chef y lo maneja el desarrollador o
  administrador desde su workstation.
  • Todos los componentes de Chef que constituyen nuestro sistema están definidos aquí:
  cookbooks, entornos, roles y pruebas.
  • Una buena práctica que es frecuente es la de mantener el chef-repo en un sistema de
  control de versiones para así gestionarlo como si fuera código fuente de una aplicación.
- ### Descripción de Chef
  • Disponibilidad: excelente.
  • Facilidad de instalación: compleja
  • Mantenimiento: bajo.
  • Documentación: muy abundante.
  • Interfaz gráfica: buena.
  • Despliegue de apps: complejo.
  • Features: suficientes.
  • Agente: si.
- ## Elementos de la arquitectura
  • Chef server: servidor centralizado que contiene y gestiona la configuración de todos los
  nodos. Puede estar ubicado en un servidor independiente o alojado como servicio en la
  nube en Chef.
  • Nodo: incluye la información relativa a las recetas y roles que deben aplicarse en la máquina
  durante la ejecución de Chef Client. Los atributos y la lista de ejecución del nodo son sus
  principales características.
  • Cookbook: contiene todos los recursos e instrucciones que se necesitan para configurar
  nodos, y pueden ser reutilizados en varias listas de ejecución.
  Los cookbooks se componen habitualmente de varias recetas.
- • Recipes (recetas): consiste en un conjunto de recursos que configuran un nodo, y es una de
  las partes fundamentales de Chef.
  Recursos: son una abstracción multiplataforma de partes configurables de un nodo, como
  pueden ser usuarios, paquetes, archivos o directorios.
  • Atributos: representan la configuración del nodo, como, por ejemplo, el nombre del host, las
  versiones de los lenguajes de programación para instalar, servidor de base de datos, etc.
- • Data Bags: contienen conjuntos de datos que están disponibles globalmente, y pueden ser
  utilizados por los nodos y roles.
  • Chef Client (Cliente Chef): realiza el trabajo necesario en nombre del nodo, donde ejecuta
  las recetas correspondientes para configurar e instalar el software.
  • Repositorio Chef: componente donde se ubica el repositorio de los cookbooks, roles,
  archivos de configuración, etc.\
- Chef Solo: herramienta de línea de comandos que permite ejecutar cookbooks Chef
  independientemente, sin conectarse a un servidor Chef. Es una versión de código abierto
  del Chef Client.
  Knife (cuchillo): herramienta de línea de comandos que utilizan los usuarios para cargar los
  ficheros de configuración en el servidor Chef.