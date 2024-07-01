import Vapor

struct RootsController: RouteCollection {
    
    func boot(routes: any RoutesBuilder) throws {
        
    }
    
    @Sendable
    func getAllRoots(req: Request) async throws -> [RootDTO] {
        
    }
    
}
