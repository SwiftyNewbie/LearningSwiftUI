import SwiftUI
import SwiftData

struct ComradeList: View {
    @Query(sort: \Comrade.name) private var comrades: [Comrade]
    @Environment(\.modelContext) private var context
    @State private var newComrade: Comrade?

    init(nameFilter: String = "") {
        let predicate = #Predicate<Comrade> { comrade in
            nameFilter.isEmpty || comrade.name.localizedStandardContains(nameFilter)
        }

        _comrades = Query(filter: predicate, sort: \Comrade.name)
    }

    var body: some View {
        Group {
            if !comrades.isEmpty {
                List {
                    ForEach(comrades) { comrade in
                        NavigationLink(comrade.name) {
                            ComradeDetail(comrade: comrade)
                        }
                    }
                    .onDelete(perform: deleteComrade(indexes:))
                }
            } else {
                ContentUnavailableView("Add Comrades", systemImage: "person.and.person")
            }
        }
        .navigationTitle("Comrades")
        .toolbar {
            ToolbarItem {
                Button("Add comrade", systemImage: "plus", action: addComrade)
            }

            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .sheet(item: $newComrade) { comrade in
            NavigationStack {
                ComradeDetail(comrade: comrade, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }

    private func addComrade() {
        let newComrade = Comrade(name: "")
        context.insert(newComrade)
        self.newComrade = newComrade
    }

    private func deleteComrade(indexes: IndexSet) {
        for index in indexes {
            context.delete(comrades[index])
        }
    }
}
#Preview("Empty List") {
    NavigationStack {
        ComradeList(nameFilter: "A")
            .modelContainer(SampleData.shared.modelContainer)
    }
}
