<?php

/*
Importando arquivos de configuracao
*/
require __DIR__ . '/vendor/autoload.php';

/*
Aplicacoes que vou usar
*/
use Silex\Application;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

/*
Preciso instanciar o Application
*/
$app = new Application();
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/servicos.php';
/*
Rotas
posso chamar paginas, controllers
*/
ini_set('display_errors', false);


$app->post('/mongo', function (){

//    $pdo = new PDO('mongodb://localhost:27017');
//
//    print_r($pdo);

    $inputJSON = file_get_contents('php://input');
    $input= json_decode( $inputJSON );
    print_r($input);
    return '';
});

$app->get('/mongo/teste', function (){

    try{
        $m = new MongoDB\Client("mongodb://127.0.0.1:27017/");

        var_dump($m);
    }catch (Exception $e){
        print_r($e->getMessage());
    }


    return '';
});

$app->get('/', function (){
    return 'Works';
});

/*
Executa toda a aplicacao
*/
$app->run();