<?php
/**
 * Created by PhpStorm.
 * User: Tiago
 * Date: 22/07/2018
 * Time: 00:03
 */

namespace App\sync\controller;

use \App\iboltpag\dao\CustomerDao;
use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;

class MeController{

    public function __construct(CustomerDao $dao){
        $this->dao = $dao;
    }

    public function loginAction(Application $app, Request $req){

        if($req->request->get('token') != 'XXXXXZZZZZ'){
            return $app['twig']->render('login.twig');
        }

        //$user = $this->dao->login($req->request->get('username'), md5($req->request->get('password')));
        $user = $this->dao->login($req->request->get('username'), $req->request->get('password'));


        if($user != null){
            $session = new Session();
            $session->set('me', json_encode($user));
            $dto = json_encode(Array(
                'code' => 200,
                'msg' => 'Tudo certo',
                'obj' => $user));
            return new Response($dto);
        }else{
            $dto = json_encode(Array(
                'code' => 400,
                'msg' => 'Usuário não localizado !'));
            return new Response($dto);
        }
    }

    public function logoutAction(Application $app){
        $session = new Session();
        $session->clear();

        return $app['twig']->render('login.twig');
    }

}