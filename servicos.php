<?php
/**
 * Created by PhpStorm.
 * User: iBolt
 * Date: 26/09/2017
 * Time: 17:23
 */

$app->register(new Silex\Provider\ServiceControllerServiceProvider());
$app->register(new Silex\Provider\SessionServiceProvider());
//$app->register(new \App\sync\util\PdoServiceProvider());
$app->register(new Silex\Provider\TwigServiceProvider(), [
    'twig.path' => __DIR__ . '/src/view',
    'twig.options' => [
        'cache' => __DIR__ . '/cache'
    ]
]);

//$app['me'] = function ($c){
//    return new \App\sync\dao\CustomerDao($c['pdo']);
//};
//
//$app['me.controller'] = function ($c){
//    return new \App\sync\controller\MeController($c['me']);
//};