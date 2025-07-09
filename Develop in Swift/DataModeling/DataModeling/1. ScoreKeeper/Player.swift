import Foundation
import SwiftUI

struct Player: Identifiable {
    let id = UUID()

    var name: String
    var score: Int
    var color: Color
}

extension Player: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
