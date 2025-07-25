import SwiftData

@MainActor class SampleData {
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    private init() {
        let schema = Schema([
            Comrade.self,
            Movie.self
        ])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()

            try context.save()
        } catch {
            fatalError("Unable to initialize ModelContainer: \(error)")
        }
    }

    private func insertSampleData() {
        for comrade in Comrade.sampleData {
            context.insert(comrade)
        }

        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }
}
