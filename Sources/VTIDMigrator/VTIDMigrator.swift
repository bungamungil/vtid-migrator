import ConsoleKit
import Foundation


@main
public struct VTIDMigrator {
    
    static func main() async throws {
        let console: Console = Terminal()
        let input = CommandInput(arguments: CommandLine.arguments)
        
        var commands = AsyncCommands(enableAutocomplete: true)
        commands.use(VTIDMigratorCommand(), as: "migrate", isDefault: true)
        
        do {
            let group = commands.group(help: "Migrate VTID Databases")
            try await console.run(group, input: input)
        } catch {
            console.error("\(error)")
            exit(1)
        }
    }
    
}
