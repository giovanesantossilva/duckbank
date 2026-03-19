workspace "DuckBank" "" {
    !identifiers hierarchical

    model {
        user = person "User" "User who will manage your bank account"
        DuckBank = softwareSystem "DuckBank" "Banking services platform" {
            web = container "Web Application" "" "React" {
                tags "Web Application"
            }
            mobile = container "Mobile" "" "Fluter" {
                tags "Mobile"
            }
            gateway = container "API Gateway" "" "Kong" {
                tags "Gateway"
            }
            database = container "Database Schema" {
                tags "Database"
            }
        }
        user -> DuckBank "Manage your bank account"
        user -> DuckBank.web "Uses"
        user -> DuckBank.mobile "Uses"
        DuckBank.web -> DuckBank.gateway ""
        DuckBank.mobile -> DuckBank.gateway ""
        DuckBank.gateway -> DuckBank.database
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
