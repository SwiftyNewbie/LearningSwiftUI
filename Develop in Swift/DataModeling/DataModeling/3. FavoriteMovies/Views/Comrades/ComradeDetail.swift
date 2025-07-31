import SwiftUI
import SwiftData

struct ComradeDetail: View {
    @Bindable var comrade: Comrade
    let isNew: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Query(sort: \Movie.title) private var movies: [Movie]

    init(comrade: Comrade, isNew: Bool = false) {
        self.comrade = comrade
        self.isNew = isNew
    }

    var body: some View {
        Form {
            TextField("Name", text: $comrade.name)
                .autocorrectionDisabled()

            Picker("Favorite Movie", selection: $comrade.favoriteMovie) {
                Text("None")
                    .tag(nil as Movie?)

                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
            .pickerStyle(.wheel)
        }
        .navigationTitle(isNew ? "New Comrade" : "Comrade")
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
                        context.delete(comrade)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ComradeDetail(comrade: SampleData.shared.comrade)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
