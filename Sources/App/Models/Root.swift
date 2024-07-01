//
//  File.swift
//  
//
//  Created by Andrea Ciani on 01/07/24.
//

import Fluent
import struct Foundation.UUID

final class Root: Model, @unchecked Sendable {

    static let schema = "roots"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "endpoint")
    var endpoint: String
    
    @Field(key: "active")
    var active: Bool
    
    init() { }
    
    init(id: UUID?, name: String, endpoint: String, active: Bool = true) {
        self.id = id
        self.name = name
        self.endpoint = endpoint
        self.active = active
    }
}

extension Root {
    
    func toDTO() -> RootDTO {
        .init(
            id: self.id,
            name: self.name,
            endpoint: self.endpoint,
            active: self.active
        )
    }
    
}
