# PHP Dockerized

> Dockerized PHP development stack: Nginx, PostgreSQL, PHP-FPM (PHP 7), Memcached, Redis and Elasticsearch

PHP Dockerized gives you everything you need for developing PHP 7 applications locally. 

## What's inside

* [Apache](http://apache.org/)
* [PostgreSQL](http://www.postgresql.org/)
* [PHP](http://php.net/)
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/)
* [Elasticsearch](http://www.elasticsearch.org/)

## Requirements

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows only)

### Getting started
1. Run `make init` in the project directory:

    ```bash
    make init
    ```

    It will build the container.

2. `make up` to run the project and attach tty or `make run` to run in background. It will be accessible on `http://localhost`

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## SSH access

Run cd command to open your docker root folder

```shell script
cd php7-dockerized-laravel/
```

To connect to apache server via ssh run:

```shell script
make cli
```


## License

Licensed under the terms of the [MIT license](LICENSE.md).
