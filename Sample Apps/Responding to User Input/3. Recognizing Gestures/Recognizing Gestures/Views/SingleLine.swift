import SwiftUI

struct SingleLine: View {
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero

    var body: some View {
        VStack {
            Text("Touch and drag to make a line")
            Spacer()
            Path { path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }
            .stroke(Color.green, lineWidth: 8.0)
            .contentShape(Rectangle())
            .gesture(draw)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Reset") {
                    lineStart = .zero
                    lineEnd = .zero
                }
            }
        }
    }

    var draw: some Gesture {
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
            }
            .onEnded { value in
                lineEnd = value.location
            }
    }
}

#Preview {
    TabView {
        Tab {
            SingleLine()
        } label: {
            Label("Line", systemImage: "pencil.line")
        }
    }
}
