//
//  File.swift
//  
//
//  Created by Anthony Da cruz on 17/10/2021.
//

import Foundation
import Fluent
import Vapor

extension Character: Content { }

final class Character: Model {

    static let schema = "characters"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    init() {}
    
    @Field(key: "life")
    var life: Int
    
    @Field(key: "strength")
    var strength: Int
    
    @Field(key: "power")
    var power: Int
    
    @Field(key: "level")
    var level: Int
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

}

