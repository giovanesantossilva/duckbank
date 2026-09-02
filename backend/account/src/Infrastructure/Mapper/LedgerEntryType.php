<?php

namespace App\Infrastructure\Mapper;

enum LedgerEntryType: string
{
    case CREDIT = 'CREDIT';
    case DEBIT = 'DEBIT';
}
