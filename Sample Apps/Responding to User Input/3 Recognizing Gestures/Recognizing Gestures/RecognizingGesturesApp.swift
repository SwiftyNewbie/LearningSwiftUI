import SwiftUI

@main
struct RecognizingGesturesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab {
                    TapView()
                } label: {
                    Label("Tap", systemImage: "touchid")
                }

                Tab {
                    LongPressView()
                } label: {
                    Label("Press", systemImage: "hand.tap.fill")
                }

                Tab {
                    DragView()
                } label: {
                    Label("Drag", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                }

                Tab {
                    RotateView()
                } label: {
                    Label("Rotate", systemImage: "rotate.right")
                }

                Tab {
                    SingleLine()
                } label: {
                    Label("Line", systemImage: "pencil.line")
                }
            }
        }
    }
}
