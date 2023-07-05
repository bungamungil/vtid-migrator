//
//  CommandContext+Fluent.swift
//  
//
//  Created by Bunga Mungil on 05/07/23.
//

import ConsoleKit
import FluentKit


extension CommandContext {
    
    var databases: Databases {
        VTIDMigrator.config.databases
    }
    
    var migrations: Migrations {
        VTIDMigrator.config.migrations
    }
    
    var migrator: Migrator {
        Migrator(
            databases: self.databases,
            migrations: self.migrations,
            logger: .init(label: "vtid-migrator"),
            on: self.databases.eventLoopGroup.any(),
            migrationLogLevel: .info
        )
    }
    
}
