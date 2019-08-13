import GRDB

struct AppDatabase {
    static func openDatabase(atPath path: String) throws -> DatabaseQueue {
        let dbQueue = try DatabaseQueue(path: path)
        try migrator.migrate(dbQueue)

        return dbQueue
    }

    static var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()

        migrator.registerMigration("create todo") { db in
            try db.create(table: "todos") { t in
                t.autoIncrementedPrimaryKey("id_int")
                t.column("id", .text).notNull()
                t.column("title", .text).notNull()
            }
        }

        return migrator
    }
}
