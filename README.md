# Sistema de gestión para gimnasio 
Esta aplicacion usa:
- PHP 5.6.x
- CodeIgniter v3
- MySQL

## Instalacion
- Ambiente
Puede instalar los requerimientos anteriores por separado o puede usar [XAMPP](https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/) para windows.
- Clone el repositorio:
```bash
git clone https://github.com/gmllasacas/gym.git
```
- Ajuste el archivo de configuracion (segun environment):
```bash
application\config\development\config.php
```
- Levante la base de datos, ejecute el script:
```bash
scripts\base.sql
```

## Uso
Ingrese al sistema mediante la ruta, e ingrese su usuario y contraseña:
- GET https://localhost/gym