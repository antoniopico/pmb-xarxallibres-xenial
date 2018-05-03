# pmb-xarxallibres-xenial

## Roadmap

 * Devolucion Multiple a partir de un usuario.
 * Formulario de cambio de Signatura
 * PDFs que saltan tejuelos
 * Informe custom del banco de libros (MySQL)
 

## MySQL tricks

### Importar Base de datos desde Trusty

```sql
mysql -u root -p < copia_mysql_all_20180418.sql
```	

### Cambiar la contrasenya de un usuario

```sql
use mysql;
update user set authentication_string = PASSWORD('My PASSWORD') where Host = 'localhost' AND User = 'pmb_user';
```
