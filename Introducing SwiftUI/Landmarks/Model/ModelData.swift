import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default

    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }

    var features: [Landmark] {
        landmarks.filter(\.isFeatured)
    }
}


func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find a file \(fileName)")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName): \(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self): \(error)")
    }
}
