- **Protección de la infraestructura**
  • Protección de las instancias físicas o virtuales sobre las que se lanzan los
  procesos → No únicamente los servidores sino también cualquier otro
  objeto perteneciente a la infraestructura: balanceadores, dispositivos de
  conexión, redes virtuales, etc.
  • Pruebas de red
  • Realización de pruebas de acceso en entorno de
  desarrollo/preproducción
  • Escaneos de puertos
  • Comprobación de las reglas del firewall (grupo de seguridad)
- **Protección de la infraestructura**
  • Bases de datos y almacenamiento
  • Sistema Gestor de Base de Datos como sistema propio,
  • Base de Datos como servicio → Amazon RDS
  • Almacenamiento de Objetos → Amazon S3
  • ¿Acceso sin credenciales? ¿Sólo puertos de acceso necesarios?
- • Otros elementos de infraestructura
  • Servidor Bastión
  • ¿Acceso por clave pública a los servidores bastión?
  • Puntos de entrada de VPN
  • ¿El servidor VPN acepta sólo clientes actualizados (sin
  vulnerabilidades)?
  • Los entornos de desarrollo/preproducción pueden no tener
  configurada toda la complejidad de infraestructura que tiene el
  entorno final de producción.
  • Las pruebas se realizarán sobre el propio entorno de producción