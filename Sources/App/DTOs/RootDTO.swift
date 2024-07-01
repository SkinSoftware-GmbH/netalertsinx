import Fluent
import Vapor

struct RootDTO: Content {
    var id: UUID?
    var name: String
    var endpoint: String
    var active: Bool = false
    
    func toModel() -> Root {
        let model = Root()
        
        model.id = self.id
        model.name = self.name
        model.endpoint = self.endpoint
        model.active = self.active
        
        return model
    }
}
