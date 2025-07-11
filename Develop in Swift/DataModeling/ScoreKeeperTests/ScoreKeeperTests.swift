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

    @Test("Highest score wins")
    func highestScoreWins() {
        var scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .black),
                Player(name: "Andre", score: 5, color: .blue),
            ],
            state: .gameOver,
            doesHighestScoreWin: true)

        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 5, color: .blue)])
    }

    @Test("Lowest score wins")
    func lowestScoreWins() {
        var scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .black),
                Player(name: "Andre", score: 5, color: .blue),
            ],
            state: .gameOver,
            doesHighestScoreWin: false)

        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0, color: .black)])
    }

    @Test("Two winers")
    func twoWinners() {
        var scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .black),
                Player(name: "Andre", score: 5, color: .blue),
                Player(name: "John", score: 5, color: .green),
            ],
            state: .gameOver,
            doesHighestScoreWin: true)

        let winners = scoreboard.winners
        #expect(winners == [
            Player(name: "Andre", score: 5, color: .blue),
            Player(name: "John", score: 5, color: .green),
        ])
    }

    @Test("One Round")
    func oneRound() {
        var scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .black),
                Player(name: "Andre", score: 5, color: .blue),
                Player(name: "John", score: 5, color: .green),
            ],
            state: .gameOver,
            doesHighestScoreWin: true,
            rounds: 1)
        scoreboard.startGame()

        #expect(scoreboard.lastRound)
    }

    @Test("Several Round")
    func severalRounds() {
        var scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .black),
                Player(name: "Andre", score: 5, color: .blue),
                Player(name: "John", score: 5, color: .green),
            ],
            state: .gameOver,
            doesHighestScoreWin: true,
            rounds: 3)
        scoreboard.startGame()
        scoreboard.advanceRound()

        #expect(!scoreboard.lastRound)

        scoreboard.advanceRound()
        scoreboard.advanceRound()

        #expect(scoreboard.lastRound)
    }
}
