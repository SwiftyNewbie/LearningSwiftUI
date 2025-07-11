import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoint: Int
    @Binding var rounds: Int
    @Binding var pointsToWin: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)

            Divider()

            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }

            Picker("Starting points", selection: $startingPoint) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }

            Picker("Rounds", selection: $rounds) {
                Text("1 round")
                    .tag(1)
                Text("3 rounds")
                    .tag(3)
                Text("10 rounds")
                    .tag(10)
            }

            Picker("Points To Win", selection: $pointsToWin) {
                Text("10 Points to Win")
                    .tag(10)
                Text("20 Points to Win")
                    .tag(20)
                Text("100 Points to Win")
                    .tag(100)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    @Previewable @State var rounds = 1
    @Previewable @State var pointsToWin = 100
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoint: $startingPoints, rounds: $rounds, pointsToWin: $pointsToWin)
}
