import Vapor
import Fluent
import FluentPostgresDriver
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    print(Environment.get("DATABASE_URL"))
    app.views.use(.leaf)
    if let databaseURL = Environment.get("DATABASE_URL"), var postgresConfig = PostgresConfiguration(url: databaseURL) {
        postgresConfig.tlsConfiguration = .forClient(certificateVerification: .none)
        app.databases.use(.postgres(
            configuration: postgresConfig
        ), as: .psql)
    } else {
        print("Could not connect to PG nor resolve DATABASE_URL")
        assertionFailure()
    }
    
    app.migrations.add(CreateCharacters())
    // register routes
    try routes(app)
}
