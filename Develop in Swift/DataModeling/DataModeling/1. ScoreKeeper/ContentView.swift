import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    private var startingPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .fontWeight(.heavy)
                .fontDesign(.monospaced)
                .padding(.bottom)

            Grid {
                GridRow {
                    Text("Players")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)

                ForEach($scoreboard.players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)

                        Text("\(player.score)")
                        Stepper("", value: $player.score, in: 0...20)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0, color: .gray))
            }

            Spacer()

            switch scoreboard.state {
            case .setup:
                Button("Start Game", systemImage: "play.fill") {
                    scoreboard.state = .playing
                    scoreboard.resetScores(to: startingPoints)
                }
            case .playing:
                Button("End Game", systemImage: "stop.fill") {
                    scoreboard.state = .gameOver
                }
            case .gameOver:
                Button("Reset Game", systemImage: "arrow.counterclockwise") {
                    scoreboard.state = .setup
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

