import SwiftUI
import SwiftData

struct CrewMemberDetail: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Query private var movies: [Movie]
    @State private var showingMovieSelection = false
    @State private var selectedMovie: Movie?

    @Bindable var crewMember: CrewMember
    let isNew: Bool

    init(crewMember: CrewMember, isNew: Bool = false) {
        self.crewMember = crewMember
        self.isNew = isNew
    }

    private var sortedApperanceMovies: [Movie] {
        crewMember.apperance.sorted { $0.title < $1.title }
    }

    private var notAppearedInMovies: [Movie] {
        Array(Set(movies).subtracting(crewMember.apperance))
    }

    var body: some View {
        Form {
            TextField("Name", text: $crewMember.name)

            Section("Movies") {
                if crewMember.apperance.isEmpty {
                    Button("Add Movies", action: showMovieSelection)
                        .foregroundColor(.blue)
                } else {
                    ForEach(sortedApperanceMovies) { movie in
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
                    }
                    .onDelete(perform: removeFromCrewMemberAppearance)

                    Button("Add More Movies", action: showMovieSelection)
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationTitle(isNew ? "New Crew Member" : "Crew Member")
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
                        context.delete(crewMember)
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingMovieSelection) {
            MovieSelectionView(selectMovie: $selectedMovie, fromMovies: notAppearedInMovies)
        }
        .onChange(of: selectedMovie) { oldValue, newValue in
            if selectedMovie != nil {
                crewMember.apperance.append(selectedMovie!)
                selectedMovie = nil
            }
        }
    }

    private func showMovieSelection() {
        selectedMovie = nil
        showingMovieSelection = true
    }

    private func removeFromCrewMemberAppearance(idxSet: IndexSet) {
        let idsToRemove = idxSet.map { sortedApperanceMovies[$0].id }
        crewMember.apperance.removeAll { idsToRemove.contains($0.id) }
    }
}
