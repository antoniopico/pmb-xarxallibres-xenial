# pmb-xarxallibres-xenial

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
