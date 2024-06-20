### Capa de abstracción de recursos
• Puppet se encargará del «cómo», ya que conoce cómo cada tipo de recurso es gestionado
en las distintas plataformas y sistemas operativos. Para el tipo de recurso package, Puppet
tiene más de 20 proveedores distintos, que utilizan distintos gestores de paquetes, tales
como yum, aptitude, pkgadd, ports y emerge.
Mediante Facter se devuelve información sobre cada agente, incluyendo el sistema
operativo.
- • Puppet se encarga de elegir el proveedor del tipo package que corresponde con ese
  sistema operativo y será el proveedor el que verifique si el paquete «vim» se encuentra ya
  instalado. En Red Hat ejecutaría yum, mientras que en Ubuntu se ejecutaría apt.
  • Puppet reportará al Puppet Master el resultado de la aplicación del recurso o, en caso de
  haberse producido un error, la información del mismo.
- • Una transacción en Puppet del proceso de configuración de una máquina es:
- • Interpretación y compilación de la configuración.
  • Análisis para calcular cómo debería aplicarse en el agente, creando un grafo de recursos.
  • Transmisión de la configuración compilada a cada agente.
  • Puppet compila un catálogo para cada agente y lo envía a la máquina para ejecutarse. El
  resultado genera un informe que se envía de vuelta al Puppet Master.
  • Aplicación de la configuración en la máquina del agente.
  • Informe del resultado de la ejecución al Puppet Master.
- • Idempotencia: crear configuraciones y aplicarlas repetidamente en el host, lo que dará lugar
  a los mismos resultados.
  • Activar modo NOOP (no operation mode): para probar la ejecución de la configuración sin
  realmente realizar ningún cambio. En Puppet, las transacciones no se puede deshacer.
- #### Facter y los facts
  • Facter: herramienta para obtener inventario (facts): nombre, IP, etc.
  • Estos datos se guardan en variables lo que hace disponibles para su uso.
  • Ejecutar en la línea de comandos: facter. Los facts se muestran en forma: 
        > clave => valor
- • Al combinar los facts con la configuración de Puppet, podemos personalizar la configuración
  en cada una de las máquinas, permitiendo escribir recursos genéricos.
- > operatingsystem => Ubuntu
  ipaddress => 10.0.0.10