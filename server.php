<?php
    use Ratchet\Server\IoServer;
    use Ratchet\Http\HttpServer;
    use Ratchet\WebSocket\WsServer;
    use Chat\Chat;
    require_once 'application/libraries/ratchet/autoload.php';
    require_once 'application/libraries/Chat.php';

    $server = IoServer::factory(
        new HttpServer(new WsServer(new Chat())),
        8080
    );
    $server->run();

?>