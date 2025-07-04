import Combine
import Foundation

class PandaCollectionFetcher: ObservableObject {
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda

    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"

    enum FetchError: Error {
        case badRequest
        case badJSON
    }

    func fetchData() async throws {
        guard let url = URL(string: urlString) else { return }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

        let decodedData: PandaCollection

        do {
            decodedData = try JSONDecoder().decode(PandaCollection.self, from: data)
        } catch {
            throw FetchError.badJSON
        }

        await MainActor.run {
            imageData = decodedData
        }
    }
}
