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

    var body: some View {
        Form() {
            DatePicker(selection: $friend.birthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                TextField("Name", text: $friend.name)
            }
            TextField("Note", text: $friend.note)
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
