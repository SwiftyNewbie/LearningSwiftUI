import SwiftUI
import SwiftData

struct BirthdaysView: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context

    @State private var newFriend: Friend?

    var body: some View {
        NavigationStack {
            List(friends) { friend in
                NavigationLink {
                    BirthdayDetail(friend: friend)
                } label: {
                    HStack {
                        if friend.isBirthdayToday {
                            Image(systemName: "gift")
                        }

                        Text(friend.name)
                            .bold(friend.isBirthdayToday)
                        Spacer()
                        Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    }
                }
            }
            .navigationTitle("Birthdays")
            .toolbar {
                ToolbarItem() {
                    Button("Add Friend", systemImage: "plus", action: addFriend)
                }
            }
        }
        .sheet(item: $newFriend) { friend in
            NavigationStack {
                BirthdayDetail(friend: friend, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }

    private func addFriend() {
        let newFriend = Friend(name: "", birthday: .now, note: "")
        context.insert(newFriend)
        self.newFriend = newFriend
    }
}

#Preview {
    BirthdaysView()
        .modelContainer(FriendsSampleData.shared.modelContainer)
}
