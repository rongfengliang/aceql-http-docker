# aceql-http docker learning

## how to running

* change database connection info

  [config links](https://github.com/kawansoft/aceql-http#configure-jdbc-parameters-in-aceql-serverproperties-file)


* build docker image

```code
docker-compose build
```

* start docker-compose services

```code
docker-compose up -d
```

* create db demo table

```code
CREATE TABLE appdemos (
    id SERIAL PRIMARY KEY,
    appname text
);
CREATE TABLE user_login
(               
  username              varchar(255)    not null,     
  hash_password         varchar(40)     not null,
        PRIMARY KEY (username)
);
insert into user_login values ('username', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8');
insert into user_login values ('MyUsername', 'eabbec6f31804eb968e2faeaaef150546a595fc3');
```

* create session

```code
curl --data-urlencode "password=MySecret" \
 http://localhost:9090/aceql/database/postgres/username/MyUsername/connect
```
result

```code
{
    "status":"OK",
    "connection_id":"2120127074",
    "session_id":"mxnqvt867sf9jgf3snbknk8ysc"
}
```
* insert some datas

```code
 curl --data-urlencode "sql=insert into appdemos values (1,'dalongdemo')" http://localhost:9090/aceql/session/mxnqvt867sf9jgf3snbknk8ysc/execute_update
 curl --data-urlencode "sql=insert into appdemos values (2,'daldddongdemo')" http://localhost:9090/aceql/session/mxnqvt867sf9jgf3snbknk8ysc/execute_update
 ```
* query results

```code
curl --data-urlencode "sql=select * from appdemos" --data "pretty_printing=true" http://localhost:9090/aceql/session/mxnqvt867sf9jgf3snbknk8ysc/execute_query
```