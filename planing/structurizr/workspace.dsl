workspace "DuckBank" "" {
    !identifiers hierarchical

    model {
        user = person "User" "User who will manage your bank account"
        DuckBank = softwareSystem "DuckBank" "Banking services platform" {
            web = container "Web Application" "" "React" {
                tags "Web Application"
            }
            gateway = container "API Gateway" "Redirects traffic" "Kong" {
                tags "Gateway"
            }
            userService = container "User Service" "Manage user" "Symfony" {
                tags "API"
            }
            acctountService = container "Account Service" "Manage account" "Symfony" {
                tags "API"
            }
            database = container "Database Schema" "" "PostgreSQL" {
                tags "Database"
            }
        }
        user -> DuckBank "Manage your bank account"
        user -> DuckBank.web "Uses"
        DuckBank.web -> DuckBank.gateway ""
        DuckBank.gateway -> DuckBank.userService ""
        DuckBank.gateway -> DuckBank.acctountService ""
        DuckBank.userService -> DuckBank.database ""
        DuckBank.acctountService -> DuckBank.database ""
    }

    views {
        systemContext DuckBank "SystemContext" {
            include *
        }
        container DuckBank "Container" {
            include *
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
        }
    }
}
