import SwiftUI
import SwiftData

struct BirthdayDetail: View {
    @Bindable var friend: Friend
    let isNew: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }

    var sortedGiftIdeas: [Gift] {
        friend.giftIdeas.sorted { $0.title < $1.title }
    }

    var body: some View {
        Form {
            DatePicker(selection: $friend.birthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                TextField("Name", text: $friend.name)
            }

            TextField("Note", text: $friend.note)

            Section("Gift Ideas") {
                ForEach(sortedGiftIdeas) { giftIdea in
                    Text(giftIdea.title)
                }
                .onDelete { idxSet in
                    idxSet.forEach { idx in
                        let giftToDelete = sortedGiftIdeas[idx]
                        friend.giftIdeas.removeAll { $0 === giftToDelete }
                        context.delete(giftToDelete)
                    }
                }

                Button("Add New Random Idea") {
                    let ideas = ["Money", "Cash", "Car", "Insurance", "House", "iPhone", "MacBook"]
                    let newGiftIdea = Gift(title: ideas.randomElement() ?? "Flowers")
                    context.insert(newGiftIdea)
                    friend.giftIdeas.append(newGiftIdea)
                }
            }
        }
        .navigationTitle(isNew ? "New Birthday" : friend.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    let friend = Friend(name: "Victor", birthday: .now, note: "Nope")
    NavigationStack {
        BirthdayDetail(friend: friend)
    }
}
