import SwiftUI

@main
struct LayingOutViewsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab {
                    LayingOutContainersView()
                } label: {
                    Label("Organize", systemImage: "square.on.circle.fill")
                }
                Tab {
                    SizingView()
                } label: {
                    Label("Size", systemImage: "square.resize")
                }
                Tab {
                    AmazingAlignmentView()
                } label: {
                    Label("Align", systemImage: "align.horizontal.left")
                }
                Tab {
                    DebuggingView()
                } label: {
                    Label("Debug", systemImage: "crown")
                }
                Tab {
                    MoodViewFullView()
                } label: {
                    Label("Mood", systemImage: "face.smiling")
                }
            }
        }
    }
}
