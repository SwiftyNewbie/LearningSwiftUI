import Foundation
import SwiftUI

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0, color: .red),
        Player(name: "Andre", score: 0, color: .blue),
        Player(name: "Jasmine", score: 0, color: .green),
    ]

    var state = GameState.setup
    var doesHighestScoreWin = true

    var rounds = 1
    var currentRound = 1
    var lastRound: Bool {
        currentRound >= rounds
    }

    var winners: [Player] {
        guard state == .gameOver else { return [] }
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }

        return players.filter { player in
            player.score == winningScore
        }
    }

    mutating func resetScores(to newValue: Int) {
        for i in 0..<players.count {
            players[i].score = newValue
        }
    }

    mutating func startGame(of rounds: Int) {
        currentRound = 1
        self.rounds = rounds
    }

    mutating func advanceRound() {
        currentRound += 1
    }
}
