import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Comrades", systemImage: "person.and.person") {
                FilteredComradeList()
            }

            Tab("Movies", systemImage: "film.stack.fill") {
                FilteredMovieList()
            }

            Tab("Cast", systemImage: "person.3.fill") {
                CastList()
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
