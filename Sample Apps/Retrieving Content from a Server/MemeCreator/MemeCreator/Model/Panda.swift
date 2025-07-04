import Foundation

struct Panda: Codable {
    var description: String
    var imageUrl: URL?

    static let defaultPanda = Panda(description: "Cute Panda", imageUrl: URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/pandaBuggingOut.jpg"))
}
