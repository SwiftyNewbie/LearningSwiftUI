import SwiftData
import Foundation

@Model
class Movie {
    var title: String
    var releaseYear: Int
    @Relationship(inverse: \CrewMember.apperance) var crew: [CrewMember]

    init(title: String, releaseYear: Int, crew: [CrewMember]) {
        self.title = title
        self.releaseYear = releaseYear
        self.crew = crew
    }
}

extension Movie {
    static let sampleData = [
        Movie(title: "Amusing Space Traveler 3", releaseYear: 2014, crew: []),
        Movie(title: "Difficult Cat", releaseYear: 1999, crew: []),
        Movie(title: "Electrifying Trek", releaseYear: 2001, crew: []),
        Movie(title: "Reckless Train Ride 2", releaseYear: 2025, crew: []),
        Movie(title: "The Last Venture", releaseYear: 1964, crew: []),
        Movie(title: "Glamorous Neighbor", releaseYear: 1984, crew: []),
    ]
}
