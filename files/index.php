<?php
require 'vendor/autoload.php';

$app = new \Slim\App();

$app->get('/', function () {
   print "Slim is a PHP micro framework that helps you quickly write simple yet powerful web";
});

$app->get('/list', function () {
   print "some list here";
});

$app->get('/name/{name}', function ($request, $response, $args) {
   print $args['name'];
});

$app->run();
