import SwiftUI
import SwiftData

@main
struct DataModelingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, Comrade.self, Friend.self, Gift.self])
    }
}
