import Fluent

struct CreateRoots: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("roots")
            .id()
            .field("name", .string, .required)
            .field("endpoint", .string, .required)
            .field("active", .bool)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("roots").delete()
    }
}
