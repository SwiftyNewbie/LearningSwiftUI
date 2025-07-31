import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Comrades", systemImage: "person.and.person") {
                ComradeList()
            }

            Tab("Movies", systemImage: "film.stack.fill") {
                FilteredMovieList()
            }

            Tab("Score", systemImage: "gamecontroller") {
                ScoreKeeperView()
            }

            Tab("Birthdays", systemImage: "calendar.and.person") {
                BirthdaysView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
