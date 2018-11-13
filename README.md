# PHP Dockerized

> Dockerized PHP development stack: Nginx, PostgreSQL, PHP-FPM (PHP 7), Memcached, Redis and Elasticsearch

PHP Dockerized gives you everything you need for developing PHP 7 applications locally. 

## What's inside

* [Nginx](http://nginx.org/)
* [PostgreSQL](http://www.postgresql.org/)
* [PHP-FPM](http://php-fpm.org/)
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/)
* [Elasticsearch](http://www.elasticsearch.org/)

## Requirements

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows only)

## Configuration


```sh
$ docker-compose build
```

## Running

Set up a Docker Machine and then run:

```sh
$ docker-compose up
```

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## SSH access

To connect to nginx via ssh run:

```sh
$ docker-compose exec nginx /bin/bash
```


## License

Licensed under the terms of the [MIT license](LICENSE.md).
