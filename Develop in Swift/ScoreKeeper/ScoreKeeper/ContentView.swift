import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 0),
            Player(name: "Jasmine", score: 0),
        ]

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

                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)

                        Text("\(player.score)")

                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct Player: Identifiable {
    let id = UUID()

    var name: String
    var score: Int
}
