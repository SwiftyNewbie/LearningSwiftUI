import SwiftUI

struct ScoreView: View {
    @Environment(Alphabetizer.self) private var aphabetizer

    var body: some View {
        Text("Score: \(aphabetizer.score)")
            .font(.largeTitle)
            .foregroundStyle(Color.purple)
            .bold()
    }
}

#Preview {
    ScoreView()
        .environment(Alphabetizer())
}
