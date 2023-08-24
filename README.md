# django-db

My sample app for django 4.x that shows how to use dj-database-url in it's simplest form.

## Using

If ```DATABASE_URL``` is defined, then it will use that to connect to a Database, otherwise it will create the standard db.sqlite3 database file.

## Example

```DATABASE_URL=postgres://username:password@localhost:5432/marketing```

# What changed
Basically, using https://pypi.org/project/dj-database-url/ we can minimize the code as follows:

```
DATABASES = {
    'default': dj_database_url.config(
        default='sqlite:///' + (BASE_DIR / 'db.sqlite3').as_posix(),
        conn_max_age=600,
        conn_health_checks=True,
    )
}
```
