import SwiftUI

struct ChatBubblesView: View {
    var body: some View {
        VStack(spacing: 25) {
            ChatBubble(text: "Knock, knock!", color: .yellow, isSquare: false)
            ChatBubble(text: "Who is there?", color: .teal, isSquare: false)
            ChatBubble(text: "It's me! Mario!", color: .yellow, isSquare: false)
            ChatBubble(text: "It's also me!", color: .brown, isSquare: true)
            ChatBubble(text: "Who??", color: .teal, isSquare: false)
            ChatBubble(text: "Doctor who", color: .brown, isSquare: true)
            ChatBubble(text: "Who?", color: .teal, isSquare: false)
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

    var shape: some Shape {
        if isSquare {
            RoundedRectangle(cornerRadius: 0)
        } else {
            RoundedRectangle(cornerRadius: 8)
        }
    }

    var body: some View {
        Text(text)
            .padding()
            .background(color, in: shape)
    }
}
