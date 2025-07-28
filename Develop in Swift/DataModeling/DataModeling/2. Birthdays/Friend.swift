import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    var note: String

    init(name: String, birthday: Date, note: String) {
        self.name = name
        self.birthday = birthday
        self.note = note
    }

    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}

@MainActor class FriendsSampleData {
    static let shared = FriendsSampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    private init() {
        let schema = Schema([Friend.self])
        let modelConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfig])

            for friend in [
                Friend(name: "Steve", birthday: .now, note: ""),
                Friend(name: "Viktor", birthday: Date(timeIntervalSinceReferenceDate: 0), note: ""),
            ] {
                context.insert(friend)
            }
            try context.save()
        } catch {
            fatalError("Failed to initialize sample data: \(error)")
        }
    }
}
