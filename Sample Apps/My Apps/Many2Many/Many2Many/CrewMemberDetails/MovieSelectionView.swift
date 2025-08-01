import SwiftUI
import SwiftData

struct MovieSelectionView: View {
    @Binding var selectMovie: Movie?
    @Environment(\.dismiss) private var dismiss
    
    let fromMovies: [Movie]

    private var movies: [Movie] {
        fromMovies.sorted { $0.title < $1.title }
    }

    var body: some View {
        NavigationView {
            List(movies, id: \.self) { movie in
                HStack {
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text("\(movie.releaseYear)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    dismissWithSelected(movie)
                }
            }
            .navigationTitle("Select Movies")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismissWithSelected(nil)
                    }
                }
            }
        }
    }

    private func dismissWithSelected(_ movie: Movie?) {
        selectMovie = movie
        dismiss()
    }
}
