import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0, color: .red),
        Player(name: "Andre", score: 0, color: .blue),
        Player(name: "Jasmine", score: 0, color: .green),
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
                        Stepper("", value: $player.score, in: 0...20)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0, color: .gray))
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

