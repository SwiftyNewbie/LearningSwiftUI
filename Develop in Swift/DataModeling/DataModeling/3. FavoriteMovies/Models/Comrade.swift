import SwiftData

@Model class Comrade {
    var name: String

    init(name: String) {
        self.name = name
    }

    static let sampleData = [
        Comrade(name: "Elena"),
        Comrade(name: "Graham"),
        Comrade(name: "Mayuri"),
        Comrade(name: "Rich"),
        Comrade(name: "Rody"),
    ]
}
