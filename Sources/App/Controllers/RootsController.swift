import Vapor

struct RootsController: RouteCollection {
    
    func boot(routes: any RoutesBuilder) throws {
        
        let roots = routes.grouped("roots")
        roots.get(use: getAllRoots)
        roots.post(use: create)
        
    }
    
    
    /// Returns all the Roots configured in the system
    /// - Parameter req: request
    /// - Returns: Array of roots
    @Sendable
    func getAllRoots(req: Request) async throws -> [RootDTO] {
        try await Root.query(on: req.db).all().map { $0.toDTO() }
    }
    
    @Sendable 
    func create(req: Request) async throws -> RootDTO {
        let root = try req.content.decode(RootDTO.self).toModel()
        try await root.save(on: req.db)
        return root.toDTO()
    }
    
}
