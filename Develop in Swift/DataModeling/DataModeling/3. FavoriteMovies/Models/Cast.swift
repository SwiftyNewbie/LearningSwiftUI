import SwiftData

@Model class Cast {
    var name: String
    var appeared = [Movie]()

    init(name: String) {
        self.name = name
    }

    static let sampleData = [
        Cast(name: "Greg Philips"),
        Cast(name: "Antony Hopkins"),
    ]
}
