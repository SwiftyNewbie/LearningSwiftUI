import SwiftUI
import SwiftData

struct CrewMemberList: View {
    @Query private var crew: [CrewMember]
    @Environment(\.modelContext) private var context

    @State private var newMember: CrewMember?

    var body: some View {
        NavigationStack {
            Group {
                if !crew.isEmpty {
                    List {
                        ForEach(crew) { member in
                            NavigationLink(member.name) {
                                CrewMemberDetail(crewMember: member)
                            }
                        }
                        .onDelete(perform: deleteMembers(indexes:))
                    }
                } else {
                    ContentUnavailableView("No Crew Members", systemImage: "person.3")
                }
            }
            .navigationTitle("Crew")
            .toolbar {
                ToolbarItem {
                    Button("Add Member", systemImage: "plus", action: addMember)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newMember) { member in
                NavigationStack {
                    CrewMemberDetail(crewMember: member, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        }
    }

    private func addMember() {
        let newMember = CrewMember(name: "", apperance: [])
        context.insert(newMember)
        self.newMember = newMember
    }

    private func deleteMembers(indexes: IndexSet) {
        for index in indexes {
            context.delete(crew[index])
        }
    }
}

#Preview {
    CrewMemberList()
        .modelContainer(SampleData.shared.modelContainer)
}
