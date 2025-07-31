import SwiftUI
import SwiftData

struct CastDetails: View {
    @Bindable var cast: Cast
    @Query private var movies: [Movie]
    let isNew: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var selectedMovie: Movie?

    init(cast: Cast, isNew: Bool = false) {
        self.cast = cast
        self.isNew = isNew
    }

    var body: some View {
        Form {
            TextField("Name", text: $cast.name)

            Section("Appearance") {
                ForEach(cast.appeared) { movie in
                    Text(movie.title)
                }
                Picker("Select a movie", selection: $selectedMovie) {
                    Text("None")
                        .tag(nil as Movie?)

                    ForEach(movies) { movie in
                        Text(movie.title)
                            .tag(movie)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Cast" : "Cast")
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
                        context.delete(cast)
                        dismiss()
                    }
                }
            }
        }
        .onChange(of: selectedMovie) { oldValue, newValue in
            if let selectedMovie {
                selectedMovie.cast.append(cast)
                cast.appeared.append(selectedMovie)
                self.selectedMovie = nil as Movie?
            }
        }
    }
}
