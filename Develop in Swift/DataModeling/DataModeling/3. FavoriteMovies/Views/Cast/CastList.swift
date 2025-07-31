import SwiftUI
import SwiftData

struct CastList: View {
    @Query private var cast: [Cast]
    @Environment(\.modelContext) private var context
    @State private var newMemeber: Cast?

    var body: some View {
        NavigationSplitView {
            Group {
                if !cast.isEmpty {
                    List {
                        ForEach(cast) { member in
                            NavigationLink(member.name) {
                                CastDetails(cast: member)
                            }
                        }
                        .onDelete(perform: deleteCast(indexes:))
                    }
                } else {
                    ContentUnavailableView("Add Cast", systemImage: "person.fill")
                }
            }
            .navigationTitle("Cast")
            .toolbar {
                ToolbarItem {
                    Button("Add Cast", systemImage: "plus", action: addCast)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newMemeber) { cast in
                NavigationStack {
                    CastDetails(cast: cast, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a cast")
                .navigationTitle("Cast")
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func addCast() {
        let newMember = Cast(name: "")
        context.insert(newMember)
        self.newMemeber = newMember
    }

    private func deleteCast(indexes: IndexSet) {
        for index in indexes {
            let castToDelete = cast[index]
            castToDelete.appeared.forEach { movie in
                movie.cast.removeAll { $0.id == castToDelete.id }
            }
            context.delete(cast[index])
        }
    }
}

#Preview {
    NavigationStack {
        CastList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}
