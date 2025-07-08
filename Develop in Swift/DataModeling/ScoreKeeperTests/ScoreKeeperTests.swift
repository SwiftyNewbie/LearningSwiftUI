import Testing
import SwiftUI
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0, color: .black),
            Player(name: "Andre", score: 5, color: .blue),
        ])

        scoreboard.resetScores(to: newValue)

        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }

}
