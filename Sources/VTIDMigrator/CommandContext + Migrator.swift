//
//  CommandContext + Migrator.swift
//  
//
//  Created by Bunga Mungil on 05/07/23.
//

import ConsoleKit
import FluentKit


extension CommandContext {
    
    var migrations: Migrations {
        VTIDMigrator.migrations
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


