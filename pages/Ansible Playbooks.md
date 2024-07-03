# Introducción a los playbooks
• Ansible utiliza YAML como formato de ficheros para definir el estado de la configuración. Estos
ficheros son los denominados playbooks.
• En ellos se define el estado deseado mediante un comandos y argumentos y cualquier otro dato
de configuración listado de tareas, compuestas por un conjunto de que pudiera requerirse. Se
pueden ejecutar sincrona o asincronamente, dependiendo de la naturaleza de la tarea y lo que el
playbook requiera.
Los playbooks se parecen más a un modelo de sistemas que a un lenguaje de programación o script.
• Ansible se asegura de que las máquinas están en ese estado definido.
- ## Primer playbook
  • Los archivos YAML comienzan por definir una sección de metadatos (habitualmente
  conocido como asunto frontal - front matter).
  • Lo habitual es empezar con tres guiones seguidos en una sola línea.
  • A continuación, se especifica el grupo de host en donde ejecutar el playbook seguida de la
  sección tasks añadiendo nombres (name) a las tareas para que ejecuten los módulos con
  atributos.
- ### Primer playbook ---
- > hosts: all
  tasks:
- > name: Make sure that we can connect to the machine
  ping:
- > name: Install PHP
  apt: name=php state=present update_cache=yes
- • Become: ejecutar los comandos con permisos de administrador y no con el usuario
  «vagrant».
  • Utilizar una lista de elementos dentro del argumento name:
- >hosts: all
  become: true
  tasks:
- >name: Install required packages
  apt:
  state: present
  update_cache: yes
  name:
- - php
- - nginx
- - mysql-server
- ## Playbooks e idempotencia
  • <ins>Idempotencia </ins>se refiere a la posibilidad de hacer algo muchas veces sin que el resultado varíe
  en cualquiera de las veces. En Ansible, un playbook es idempotente si el resultado de ejecutarlo
  sucesivas veces no varía el estado de configuración obtenido tras la primera ejecución.
  * La mayoría de los módulos de Ansible que puedes utilizar en tus playbooks son idempotentes
  salvo los módulos command o shell, que siempre se ejecutarán al procesar el playbook, dado
  que Ansible no puede determinar por sí solo si la acción que va a ejecutar el comando se ha
  realizado ya anteriormente o no.
  • Por ejemplo, borrar un archivo a través de un comando.
-