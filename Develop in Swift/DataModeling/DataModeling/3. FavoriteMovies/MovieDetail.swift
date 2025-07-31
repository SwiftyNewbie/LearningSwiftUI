import SwiftUI
import SwiftData

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }

    var sortedComrades: [Comrade] {
        movie.favoritedBy.sorted { lhs, rhs in
            lhs.name < rhs.name
        }
    }

    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)

            DatePicker("Release data", selection: $movie.releaseDate, displayedComponents: .date)

            if !movie.favoritedBy.isEmpty {
                Section("Favorited by") {
                    ForEach(sortedComrades) { comrade in
                        Text(comrade.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
