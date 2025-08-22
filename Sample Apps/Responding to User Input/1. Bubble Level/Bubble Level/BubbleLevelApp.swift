import SwiftUI

@main
struct BubbleLevelApp: App {
    @State var motionDetector = MotionDetector(updateInterval: 0.01)
    var body: some Scene {
        WindowGroup {
            VStack {
                BubbleLevel()
                OrientationDataView()
                    .padding(.top, 80)
            }
            .onAppear {
                motionDetector.start()
            }
            .onDisappear {
                motionDetector.stop()
            }
        }
    }
}
