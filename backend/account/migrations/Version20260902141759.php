<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260902141759 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA account');
        $this->addSql('CREATE TABLE account.account (id UUID NOT NULL, customer_id UUID NOT NULL, code VARCHAR(20) NOT NULL, type VARCHAR(255) NOT NULL, currency VARCHAR(255) NOT NULL, status VARCHAR(255) NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY (id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D4E7D3E277153098 ON account.account (code)');
        $this->addSql('CREATE TABLE account.ledger_entry (id UUID NOT NULL, account_id UUID NOT NULL, transaction_id UUID NOT NULL, type VARCHAR(255) NOT NULL, amount NUMERIC(19, 4) NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY (id))');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE account.account');
        $this->addSql('DROP TABLE account.ledger_entry');
    }
}
