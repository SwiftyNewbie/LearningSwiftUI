import SwiftUI
import SwiftData

struct ComradeList: View {
    @Query(sort: \Comrade.name) private var comrades: [Comrade]
    @Environment(\.modelContext) private var context
    @State private var newComrade: Comrade?

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(comrades) { comrade in
                    NavigationLink(comrade.name) {
                        ComradeDetail(comrade: comrade)
                    }
                }
                .onDelete(perform: deleteComrade(indexes:))
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
        } detail: {
            Text("Select a comrade")
                .navigationTitle("Comrade")
                .navigationBarTitleDisplayMode(.inline)
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
