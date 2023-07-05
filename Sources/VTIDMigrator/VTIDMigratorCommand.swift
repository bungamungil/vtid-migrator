//
//  VTIDMigratorCommand.swift
//  
//
//  Created by Bunga Mungil on 05/07/23.
//

import ConsoleKit


final class VTIDMigratorCommand: AsyncCommand {
    
    struct Signature: CommandSignature {
        
    }
    
    var help: String = "Migrate VTID Databases"
    
    func run(using context: CommandContext, signature: Signature) async throws {
        context.console.output("Welcome!", style: .init(color: .brightBlue))
    }
    
}
