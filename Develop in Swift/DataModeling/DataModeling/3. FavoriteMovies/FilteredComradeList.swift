import SwiftUI
import SwiftData

struct FilteredComradeList: View {
    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            ComradeList(nameFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a comrade")
                .navigationTitle("Comrade")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
