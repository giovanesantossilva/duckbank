<?php

namespace App\Infrastructure\Http\Controller;

use Doctrine\DBAL\Connection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/health')]
final class Health extends AbstractController
{
    #[Route('', methods: [ 'GET' ])]
    public function handle(Connection $connection): Response
    {
        try {
            $connection->executeQuery('SELECT 1');
            return new Response('', Response::HTTP_NO_CONTENT);
        } catch (\Throwable) {
            return new Response('', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
