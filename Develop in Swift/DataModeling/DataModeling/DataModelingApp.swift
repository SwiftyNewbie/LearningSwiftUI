import SwiftUI
import SwiftData

@main
struct DataModelingApp: App {
    var body: some Scene {
        WindowGroup {
            FavoriteMoviesView()
//            TabView {
//                Tab("Score", systemImage: "gamecontroller") {
//                    ContentView()
//                }
//                Tab("Birthdays", systemImage: "calendar.and.person") {
//                    BirthdaysView()
//                        .modelContainer(for: Friend.self)
//                }
//            }
        }
    }
}
