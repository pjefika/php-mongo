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
ini_set('display_errors', true);


//$app->post('/mongo', function (){
//
////    $pdo = new PDO('mongodb://localhost:27017');
////
////    print_r($pdo);
//
//    $inputJSON = file_get_contents('php://input');
//    $input= json_decode( $inputJSON );
//    print_r($input);
//    return '';
//});

$app->post('/mongo/teste', function (){

    try{
        $mongo = new MongoDB\Client("mongodb://127.0.0.1:27017");
        $db = $mongo->efika;

        $filter = array('isUpdated'=>false);
//        foreach ($db->selectCollection('users')->find($filter) as $json){
//            echo '<pre>';
//            print_r($json);
//            echo '</pre>';
//        }
        $users = $db->selectCollection('users')->find($filter);
        $res = json_encode(Array(
            'code' => 200,
            'msg' => 'Registros recuperados com sucesso !',
            'users' => $users->toArray()
        ));
        return new \Symfony\Component\HttpFoundation\Response(
            $res,
            200,
            array('Content-Type' => 'application/json'));
    }catch (\Exception $e){
        print_r($e->getMessage());
        return Array(
            'code' => 500,
            'msg' => $e->getMessage()
        );
    }
});

$app->post('/efika/users', function (){
    $inputJSON = file_get_contents('php://input');
    $input= json_decode( $inputJSON );
    //print_r($input);
    return json_encode(Array(
        'code' => 200,
        'msg' => 'Usuarios sincronizados com sucesso !',
        'users' => $input
    ));
});

$app->get('/', function (){
    return 'Works';
});

/*
Executa toda a aplicacao
*/
$app->run();