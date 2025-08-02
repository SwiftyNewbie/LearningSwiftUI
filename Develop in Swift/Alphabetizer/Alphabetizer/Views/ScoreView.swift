import SwiftUI

struct ScoreView: View {
    @Environment(Alphabetizer.self) private var aphabetizer

    var body: some View {
        VStack {
            Text("Score: \(aphabetizer.score)")
                .font(.largeTitle)
                .foregroundStyle(Color.purple)
                .bold()

            if let winPercentage = aphabetizer.winPercentage {
                Text("Success Rate: \(winPercentage)%")
            }
        }
    }
}

#Preview {
    ScoreView()
        .environment(Alphabetizer())
}
