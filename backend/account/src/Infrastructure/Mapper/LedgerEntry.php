<?php

namespace App\Infrastructure\Mapper;

use Doctrine\ORM\Mapping as ORM;

#[
    ORM\Entity,
    ORM\Table(name: 'ledger_entry', schema: 'account'),
]
class LedgerEntry
{
    #[
        ORM\Id,
        ORM\Column(type: 'uuid', unique: true),
        ORM\GeneratedValue(strategy: 'CUSTOM'),
        ORM\CustomIdGenerator(class: 'doctrine.uuid_generator')
    ]
    public string $id {
        get => $this->id;
    }

    #[ORM\Column(type: 'uuid', nullable: false)]
    public string $accountId {
        get => $this->accountId;
        set => $this->accountId = $value;
    }

    #[ORM\Column(type: 'uuid', nullable: false)]
    public string $transactionId {
        get => $this->transactionId;
        set => $this->transactionId = $value;
    }

    #[ORM\Column(type: 'string', enumType: LedgerEntryType::class)]
    public LedgerEntryType $type {
        get => $this->type;
        set => $this->type = $value;
    }

    #[ORM\Column(type: 'decimal', precision: 19, scale: 4)]
    public string $amount {
        get => $this->amount;
        set => $this->amount = $value;
    }

    #[ORM\Column]
    public \DateTimeImmutable $createdAt {
        get => $this->createdAt;
    }

    public function __construct()
    {
        $this->createdAt = new \DateTimeImmutable();
    }
}
