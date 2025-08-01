import SwiftUI
import SwiftData

@main
struct Many2ManyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, CrewMember.self])
    }
}
