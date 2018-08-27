<?php
/**
 * Criado por: Tiago Iwamoto
 * Data: 08/07/2017
 * Hora: 15:45
 */

namespace App\sync\util;

use Pimple\Container;
use Pimple\ServiceProviderInterface;
use Silex\Application;

class PdoServiceProvider implements ServiceProviderInterface
{

    /**
     * Registers services on the given app.
     *
     * This method should only be used to configure services and parameters.
     * It should not get services.
     */
    public function register(Container $app)
    {
        $app['mongodb'] = function ($c) {
            $config = [
                'server' => 'mongodb://localhost:27017',
                'options' => [],
                'driverOptions' => [],
            ];
            if (!isset($app['mongodb.config'])) {
                $app['mongodb.config'] = [];
            }
            foreach ($config as $k => $v) {
                if (isset($app['mongodb.config'][$k])) {
                    $config[$k] = $app['mongodb.config'][$k];
                }
            }
            $app['mongodb.config'] = $config;
            $client = new Client(
                $app['mongodb.config']['server'],
                $app['mongodb.config']['options'],
                $app['mongodb.config']['driverOptions']
            );
            return $client;
        };
    }

    /**
     * Bootstraps the application.
     *
     * This method is called after all services are registered
     * and should be used for "dynamic" configuration (whenever
     * a service must be requested).
     */
    public function boot(Application $app)
    {
        // TODO: Implement boot() method.
    }
}