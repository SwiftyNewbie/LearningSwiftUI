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

    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)

            Picker("Release year", selection: $movie.releaseYear) {
                ForEach(1894..<2036, id: \.self) { year in
                    Text("\(year)")
                        .tag(year)
                }
            }

            Section("Cast") {
                ForEach(movie.crew) { member in
                    Text(member.name)
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
