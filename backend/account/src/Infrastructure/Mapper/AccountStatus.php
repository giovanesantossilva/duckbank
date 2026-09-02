<?php

namespace App\Infrastructure\Mapper;

enum AccountStatus: string
{
    case PENDING = 'PENDING';
    case ACTIVE = 'ACTIVE';
    case BLOCKED = 'BLOCKED';
    case CLOSED = 'CLOSED';
}
