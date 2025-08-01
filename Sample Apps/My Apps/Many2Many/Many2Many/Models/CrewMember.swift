import SwiftData
import Foundation

@Model
class CrewMember {
    var name: String
    var apperance: [Movie]

    init(name: String, apperance: [Movie]) {
        self.name = name
        self.apperance = apperance
    }
}
