workspace "The Only Ducks" " DuckBank" {
    !identifiers hierarchical

    configuration {
        scope softwaresystem
    }

    model {
        user = person "User" "User who manages bank accounts"
        duckbank = softwareSystem "DuckBank" "Banking services platform" {
            web = container "Web Application" "Web Application" "React" {
                tags "Web Application"
            }
            gateway = container "API Gateway" "Handles routing and rate limiting" "Kong" {
                tags "Gateway"
            }
            authService = container "Auth Service" "Handles authentication and sessions" "Symfony" {
                tags "Service"
            }
            userService = container "User Service" "Handles user data and lifecycle" "Symfony" {
                tags "Service"
            }
            accaountService = container "Account Service" "Handles accounts and balances" "Go Lang" {
                tags "Service"
            }
            transactionService = container "Transaction Service" "Handles transactions and transfers" "Go Lang" {
                tags "Service"
            }
            notificationService = container "Notification Service" "Handles notification" "HyperF" {
                tags "Service"
            }
            fraudService = container "Fraud Service" "Handles fraud" "Python" {
                tags "Service"
            }
            payementService = container "Payment Service" "Handles payment" "Go Lang" {
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
            fraudDatabase = container "Fraud Database" "Store fraud data" "MongoDB" {
                tags "Database"
            }
            memoryDatabase = container "Database Memory" "Cache, sessions and temporary data" "Redis" {
                tags "Database"
            }
            queue = container "Message Broker" "Event-driven communication" "Kafka" {
                tags "Queue"
            }
        }
        user -> duckbank.web "Uses" "HTTP"
        duckbank.web -> duckbank.gateway "Send request" "HTTP"
        duckbank.gateway -> duckbank.authService "Auth requests" "HTTP"
        duckbank.gateway -> duckbank.userService "User requests" "HTTP"
        duckbank.gateway -> duckbank.accaountService "Account requests" "HTTP"
        duckbank.gateway -> duckbank.transactionService "Transaction requets" "HTTP"
        duckbank.gateway -> duckbank.fraudService "Fraud requets" "HTTP"
        duckbank.authService -> duckbank.memoryDatabase "Stores sessions" "TCP"
        duckbank.userService -> duckbank.userDatabase "Reads/Writes" "TCP"
        duckbank.accaountService -> duckbank.accaountDatabase "Reads/Writes" "TCP"
        duckbank.transactionService -> duckbank.transactionDatabase "Reads/Writes" "TCP"
        duckbank.transactionService -> duckBank.payementService "Payment Gateway" "gRPC"
        duckbank.transactionService -> duckbank.queue "Publish TransactionCreated" "TCP"
        duckbank.transactionService -> duckbank.accaountService "Debit/Credit account" "gRPC"
        duckbank.fraudService -> duckbank.fraudDatabase "Reads/Writes" "TCP"
        duckbank.notificationService -> duckbank.queue "Consume TransactionCreated" "TCP"
    }

    views {
        systemContext duckbank "SystemContext" {
            include *
            autolayout lr
        }
        container duckbank "Container" {
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
                shape roundedBox
                color "#ffffff"
                border "Dashed"
            }
        }
    }
}
