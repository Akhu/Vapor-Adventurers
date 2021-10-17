import Vapor
import Fluent
import FluentPostgresDriver

struct Team: Content {
    let characters: [Character]
}

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    app.post("data") { req -> EventLoopFuture<Character> in
        
        
        let character = try req.content.decode(Character.self)
        
        return character.save(on: req.db).map {
            character
        }
    }

    app.get("characters") { req in
        return Character.query(on: req.db).all()
            .map { characters in
                return req.view.render("characters", Team(characters: characters))
            }
    }

    app.get("hello") { req -> EventLoopFuture<View> in
        return req.view.render("content")
    }
}
