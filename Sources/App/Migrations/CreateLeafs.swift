import Fluent

struct CreateLeafs: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("leafs")
            .id()
            .field("name", .string, .required)
            .field("api_path", .string, .required)
            // root to sync
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("leafs").delete()
    }
}
