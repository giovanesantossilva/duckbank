<?php

namespace App\Infrastructure\Mapper;

use Doctrine\ORM\Mapping as ORM;

#[
    ORM\Entity,
    ORM\Table(name: 'account', schema: 'account'),
]
class Account
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
    public string $customerId {
        get => $this->customerId;
    }

    #[ORM\Column(type: 'string', length: 20, unique: true, nullable: false)]
    public string $code {
        get => $this->code;
        set => $this->code = $value;
    }

    #[ORM\Column(type: 'string', enumType: AccountType::class)]
    public AccountType $type {
        get => $this->type;
        set => $this->type = $value;
    }

    #[ORM\Column(type: 'string')]
    public string $currency {
        get => $this->currency;
        set => $this->currency = $value;
    }

    #[ORM\Column(type: 'string', enumType: AccountStatus::class)]
    public AccountStatus $status {
        get => $this->status;
        set => $this->status = $value;
    }

    #[ORM\Column]
    public \DateTimeImmutable $createdAt {
        get => $this->createdAt;
    }

    #[ORM\Column]
    public \DateTimeImmutable $updatedAt {
        get => $this->updatedAt;
        set => $this->updatedAt = $value;
    }

    public function __construct()
    {
        $this->createdAt = new \DateTimeImmutable();
    }
}


