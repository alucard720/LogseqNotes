## Repositorio Chef
• El repositorio Chef es el componente con el que se suele trabajar habitualmente, realizando
las siguientes tareas:
• Desarrollo de cookbooks y recipes (recetas).
• Carga de información en el servidor Chef.
• Sincronización del código fuente del repositorio Chef con el control de versiones.
• Administración de las opciones de configuración y de los entornos.
• Interacción y aprovisionamiento de los nodos nuevos y los ya existentes.
-
- ## Herramientas Chef
  • knife (cuchillo): herramienta de línea de comandos que interactúa con el servidor Chef y la
  sincronización de los nodos.
  • Comando chef: trabaja con los componentes del repositorio Chef y la gestión del entorno
  de Ruby embebido utilizado por Chef.
  • Berkshelf: gestor de dependencia de cookbooks.
  • Test Kitchen: framework de pruebas de integración.
  • ChefSpec: framework de pruebas unitarias.
  • Foodcritic: herramienta para la realización de análisis de código estático en cookbooks.
- Instalación Chef Workstation
  https://downloads.chef.io/chef-workstation/
  1) Progress Chef*
  $ chef -v
- ### Instalación Chef Workstation
  > config.vm.provision "shell", inline: <-SHELL
  apt-get update
  curl -L https://chef.io/chef/install.sh | sudo bash
  SHELL
- ### IMPORTANTE =>
  > https://github.com/hashicorp/vagrant/issues/12337
  config vm. provision : chef.
  chef. add_recipe "apache"
  chef. arguments = "--chef-license accept"
  chef.install = false
  end
- ## Chef Supermarket
  • Supermarket is the Chef community's central clearing house for sharing cookbooks, tools,
  and plugins.