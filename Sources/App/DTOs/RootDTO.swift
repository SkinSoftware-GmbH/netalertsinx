import Fluent
import Vapor

struct RootDTO: Content {
    var id: UUID?
    var name: String?
    var endpoint: String?
    var active: Bool = false
    
    func toModel() -> Todo {
        let model = Todo()
        
        model.id = self.id
        if let title = self.title {
            model.title = title
        }
        return model
    }
}
