import ConsoleKit
import FluentKit
import Foundation
import VTIDCommandUtils
import VTIDCore


@main
public struct VTIDMigrator {
    
    static var config: CommandConfig = VTIDCommandUtils.CommandConfigs
    
    static var migrations: Migrations = Migrations()
    
    static func main() async throws {
        let console: Console = Terminal()
        let input = CommandInput(arguments: CommandLine.arguments)
        
        var commands = Commands(enableAutocomplete: true)
        commands.use(MigrateCommand(), as: "migrate", isDefault: true)

        config.databases.use(VTIDCore.DatabaseConfig, as: VTIDCore.DatabaseID)
        migrations.add(CreateSourceTableRowTables())
        
        do {
            let group = commands.group(help: "Migrate VTID Databases")
            try console.run(group, input: input)
        } catch {
            console.error("\(error)")
            exit(1)
        }
    }
    
}
