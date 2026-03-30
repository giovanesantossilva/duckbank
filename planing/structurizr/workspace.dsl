workspace "DuckBank" "" {
    !identifiers hierarchical

    model {
        user = person "User" "User who manages bank accounts"
        DuckBank = softwareSystem "DuckBank" "Banking services platform" {
            web = container "Web Application" "Frontend Application" "React" {
                tags "Web Application"
            }
            gateway = container "API Gateway" "Handles routing and rate limiting" "Kong" {
                tags "Gateway"
            }
            authService = container "Auth Service" "Handles authentication and sessions" "Symfony" {
                tags "Service"
            }
            userService = container "User Service" "Manages user data and lifecycle" "Symfony" {
                tags "Service"
            }
            accaountService = container "Account Service" "Manages accounts and balances" "Go Lang" {
                tags "Service"
            }
            transactionService = container "Transaction Service" "Handles transactions and orchestrates transfers" "HyperF" {
                tags "Service"
            }
            userDatabase = container "User Database" "Stores user data" "PostgreSQL" {
                tags "Database"
            }
            accaountDatabase = container "Account Database" "Stores account data" "PostgreSQL" {
                tags "Database"
            }
            transactionDatabase = container "Transaction Database" "Stores transaction data" "PostgreSQL" {
                tags "Database"
            }
            queue = container "Message Broker" "Event-driven communication" "RabbitMQ" {
                tags "Queue"
            }
            memoryDatabase = container "Database Memory" "Cache, sessions and temporary data" "Redis" {
                tags "Database"
            }
        }
        user -> DuckBank.web "Uses" "HTTP"
        DuckBank.web -> DuckBank.gateway "Send request" "HTTP"
        DuckBank.gateway -> DuckBank.authService "Auth requests" "HTTP"
        DuckBank.gateway -> DuckBank.userService "User requests" "HTTP"
        DuckBank.gateway -> DuckBank.accaountService "Account requests" "HTTP"
        DuckBank.gateway -> DuckBank.transactionService "Transaction requets" "HTTP"
        DuckBank.authService -> DuckBank.memoryDatabase "Stores sessions" "TCP"
        DuckBank.userService -> DuckBank.userDatabase "Reads/Writes" "TCP"
        DuckBank.accaountService -> DuckBank.accaountDatabase "Reads/Writes" "TCP"
        DuckBank.transactionService -> DuckBank.transactionDatabase "Reads/Writes" "TCP"
        DuckBank.transactionService -> DuckBank.queue "Publish TransactionCreated" "AMQP"
        DuckBank.transactionService -> DuckBank.accaountService "Debit/Credit account" "HTTP"
    }

    views {
        systemContext DuckBank "SystemContext" {
            include *
            autolayout lr
        }
        container DuckBank "Container" {
            include *
            autolayout lr
        }
        styles {
            element "Element" {
                color white
                strokeWidth 4
            }
            element "Software System" {
                stroke #1168BD
            }
            element "Person" {
                shape person
                stroke #2a7d05
            }
            element "Database" {
                shape cylinder
            }
            element "Queue" {
                shape RoundedBox
                color "#ffffff"
                border "Dashed"
            }
        }
    }
}
