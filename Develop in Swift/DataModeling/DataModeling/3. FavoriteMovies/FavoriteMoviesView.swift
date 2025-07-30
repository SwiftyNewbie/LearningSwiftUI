import SwiftUI
import SwiftData

struct FavoriteMoviesView: View {
    var body: some View {
        TabView {
            Tab("Comrades", systemImage: "person.and.person") {
                ComradeList()
            }

            Tab("Movies", systemImage: "film.stack.fill") {
                FilteredMovieList()
            }
        }
    }
}

#Preview {
    FavoriteMoviesView()
        .modelContainer(SampleData.shared.modelContainer)
}
