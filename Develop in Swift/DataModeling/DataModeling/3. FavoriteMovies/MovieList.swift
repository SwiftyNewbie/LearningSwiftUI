import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        Text("Details for \(movie.title)")
                            .navigationTitle("Movie")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
