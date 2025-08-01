import SwiftUI

struct MessageView: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    @State private var message = "Place the tiles in alphabetical order"

    var body: some View {
        Text(alphabetizer.message.rawValue)
            .font(.largeTitle)
    }
}

#Preview {
    let alphabetizer = Alphabetizer()
    alphabetizer.message = .youWin
    return MessageView()
        .environment(alphabetizer)
}
