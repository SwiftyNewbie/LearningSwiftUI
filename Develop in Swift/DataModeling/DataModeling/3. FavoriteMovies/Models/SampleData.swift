import SwiftData

@MainActor class SampleData {
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    var comrade: Comrade {
        Comrade.sampleData.first!
    }

    var movie: Movie {
        Movie.sampleData.first!
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
        Comrade.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Comrade.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Comrade.sampleData[3].favoriteMovie = Movie.sampleData[4]
        Comrade.sampleData[4].favoriteMovie = Movie.sampleData[0]
    }
}
