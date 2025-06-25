import SwiftUI

struct ChatBubblesView: View {
    var body: some View {
        VStack(spacing: 25) {
            ChatBubble(text: "Knock, knock!", color: .yellow, isSquare: false, fromSelf: false)
            ChatBubble(text: "Who is there?", color: .teal, isSquare: false, fromSelf: true)
            ChatBubble(text: "It's me! Mario!", color: .yellow, isSquare: false, fromSelf: false)
            ChatBubble(text: "It's also me!", color: .brown, isSquare: true, fromSelf: false)
            ChatBubble(text: "Who??", color: .teal, isSquare: false, fromSelf: true)
            ChatBubble(text: "Doctor Who", color: .brown, isSquare: true, fromSelf: false)
            ChatBubble(text: "Who???", color: .teal, isSquare: false, fromSelf: true)
        }
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    ChatBubblesView()
}

struct ChatBubble: View {
    let text: String
    let color: Color
    let isSquare: Bool
    let fromSelf: Bool

    var shape: some Shape {
        if isSquare {
            RoundedRectangle(cornerRadius: 2)
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }

    var body: some View {
        HStack {
            if fromSelf {
                Spacer()
            }
            Text(text)
                .padding()
                .background(color, in: shape)
            if !fromSelf {
                Spacer()
            }
        }
    }
}
