import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    @State private var searchText = ""
    @State private var sortByReleaseDate = false

    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText, sortByReleaseDate: sortByReleaseDate)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Toggle(isOn: $sortByReleaseDate) {
                            Text("By Release Date")
                        }
                    }
                }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
        }

    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
