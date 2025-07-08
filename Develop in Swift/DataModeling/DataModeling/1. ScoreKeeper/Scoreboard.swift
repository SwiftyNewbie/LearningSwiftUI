import Foundation
import SwiftUI

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0, color: .red),
        Player(name: "Andre", score: 0, color: .blue),
        Player(name: "Jasmine", score: 0, color: .green),
    ]

    var state = GameState.setup

    mutating func resetScores(to newValue: Int) {
        for i in 0..<players.count {
            players[i].score = newValue
        }
    }
}
