import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context

    @State private var newMovie: Movie?

    var body: some View {
        NavigationStack {
            Group {
                if !movies.isEmpty {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink(movie.title) {
                                MovieDetail(movie: movie)
                            }
                        }
                        .onDelete(perform: deleteMoves(indexes:))
                    }
                } else {
                    ContentUnavailableView("No Movies", systemImage: "film.stack")
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add Movie", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        }
    }

    private func addMovie() {
        let newMovie = Movie(title: "", releaseYear: 2025, crew: [])
        context.insert(newMovie)
        self.newMovie = newMovie
    }

    private func deleteMoves(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
