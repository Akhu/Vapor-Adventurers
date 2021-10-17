//
//  File.swift
//  
//
//  Created by Anthony Da cruz on 17/10/2021.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateCharacters: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("characters")
            .id()
            .field("name", .string)
            .field("life", .int16)
            .field("power", .int16)
            .field("strength", .int16)
            .field("level", .int16)
            .field("created_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("characters").delete()
    }
}
