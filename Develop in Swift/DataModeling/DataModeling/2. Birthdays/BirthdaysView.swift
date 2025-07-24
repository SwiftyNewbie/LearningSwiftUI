import SwiftUI
import SwiftData

struct BirthdaysView: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context

    @State private var newName = ""
    @State private var newDate = Date.now
    @State private var newNote = ""

    @State private var showFriendNote: Friend?

    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "gift")
                    }

                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    Button {
                        showFriendNote = friend
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }

                    TextField("Note", text: $newNote)
                        .textFieldStyle(.roundedBorder)

                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate, note: newNote)
                        context.insert(newFriend)

                        newName = ""
                        newDate = .now
                        newNote = ""
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
        .sheet(item: $showFriendNote) { friend in
            VStack {
                Text("\(friend.name)'s B-day Party Plan")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .padding(.bottom)

                Text(friend.note)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    BirthdaysView()
        .modelContainer(for: Friend.self, inMemory: true)
}
