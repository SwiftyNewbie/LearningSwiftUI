import SwiftUI

struct ScoreKeeperView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .fontWeight(.heavy)
                .fontDesign(.monospaced)
                .padding(.bottom)

            SettingsView(
                doesHighestScoreWin: $scoreboard.doesHighestScoreWin,
                startingPoint: $startingPoints,
                rounds: $scoreboard.rounds,
                pointsToWin: $scoreboard.pointsToWin
            ).disabled(scoreboard.state != .setup)

            Grid {
                GridRow {
                    Text("Players")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1)
                }
                .font(.headline)

                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .foregroundStyle(player.color)
                            ColorPicker("Player's color", selection: $player.color)
                                .labelsHidden()
                                .opacity(scoreboard.state == .setup ? 1 : 0)

                        }

                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1)

                        Stepper("", value: $player.score, in: 0...scoreboard.pointsToWin)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1)
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0, color: .gray))
            }
            .opacity(scoreboard.state == .setup ? 1 : 0)

            Spacer()

            HStack {
                Spacer()

                VStack {
                    if scoreboard.rounds > 1 {
                        Text("Current Round: \(scoreboard.currentRound)")
                            .opacity(scoreboard.state == .playing ? 1 : 0)
                    }

                    switch scoreboard.state {
                    case .setup:
                        Button("Start Game", systemImage: "play.fill") {
                            scoreboard.state = .playing
                            scoreboard.resetScores(to: startingPoints)
                            scoreboard.startGame()
                        }
                    case .playing:
                        if scoreboard.lastRound {
                            Button("End Game", systemImage: "stop.fill") {
                                scoreboard.state = .gameOver
                            }
                        } else {
                            Button("Next Round", systemImage: "forward.fill") {
                                scoreboard.advanceRound()
                            }
                        }
                    case .gameOver:
                        Button("Reset Game", systemImage: "arrow.counterclockwise") {
                            scoreboard.state = .setup
                        }
                    }
                }

                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
        .onChange(of: scoreboard.isPlayerReachedRequiredNumberOfPointsToWin) { _, newValue in
            if newValue && scoreboard.state == .playing {
                scoreboard.state = .gameOver
            }
        }
    }
}

#Preview {
    ScoreKeeperView()
}

