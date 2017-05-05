### php_slim_framework ###

 Docker image to create a simple Api Restfull using the Slim 3 micro-framework for PHP

### pull php_slim_framework from : https://hub.docker.com/r/mmahrach/php_slim_framework/ ###
```
$ docker pull mmahrach/php_slim_framework
```

### Import the dockerfile ###
```
$ git clone https://github.com/momah/php_slim_framework.git
```
### Build the dockerfile ###

```
$ sudo docker build -t php_slim_framework:<tag/version> ./
```
### Run the dockerfile ###
 
```
$ sudo docker run -d -p 8000:80 mmahrach/php_slim_framework:1.0
```

