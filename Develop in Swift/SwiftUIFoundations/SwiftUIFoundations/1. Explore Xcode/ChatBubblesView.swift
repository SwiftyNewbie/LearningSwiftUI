import SwiftUI

struct ChatBubblesView: View {
    var body: some View {
        VStack(spacing: 25) {
            ChatBubble(text: "Knock, knock!", color: .yellow, isEllipse: false, fromSelf: false)
            ChatBubble(text: "Who is there?", color: .teal, isEllipse: false, fromSelf: true)
            ChatBubble(text: "It's me! Mario!", color: .yellow, isEllipse: false, fromSelf: false)
            ChatBubble(text: "It's also me!", color: .brown, isEllipse: true, fromSelf: false)
            ChatBubble(text: "Who??", color: .teal, isEllipse: false, fromSelf: true)
            ChatBubble(text: "Doctor Who", color: .brown, isEllipse: true, fromSelf: false)
            ChatBubble(text: "Who???", color: .teal, isEllipse: false, fromSelf: true)
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
    let isEllipse: Bool
    let fromSelf: Bool

    @ViewBuilder
    var shape: some View {
        if isEllipse {
            color.clipShape(Ellipse())
        } else {
            color.clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }

    var body: some View {
        HStack {
            if fromSelf {
                Spacer()
            }
            Text(text)
                .padding()
                .background(shape)
            if !fromSelf {
                Spacer()
            }
        }
    }
}
