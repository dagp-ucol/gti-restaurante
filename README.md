## Setup
### Configuracion en local
  - Clonar el repositorio y hacer un `bundle install` para instalar las gemas necesarias, en algunos casos es necesario instalar webpacker usando yarn
  - Crear el archivo config/database.yml para crear nuestras bases de datos en local, preferentemente usando Postgresql
  - Una vez configurado el archivo anterior inicializar las bases de datos con el comando `rails db:setup`
  - Correr el comando de `rails server` para ver la app corriendo en local
