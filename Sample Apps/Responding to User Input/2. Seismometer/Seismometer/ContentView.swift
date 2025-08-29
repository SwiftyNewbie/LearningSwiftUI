import SwiftUI

struct ContentView: View {
    @State private var detector = MotionDetector(updateInterval: 0.01)
    var body: some View {
        TabView {
            Tab {
                NeedleSeismometer()
            } label: {
                Label("Needle", systemImage: "gauge")
            }

            Tab {
                GraphSeismometer()
            } label: {
                Label("Graph", systemImage: "waveform.path.ecg.rectangle")
            }
        }
        .environment(detector)
        .onAppear {
            detector.start()
        }
        .onDisappear {
            detector.stop()
        }
    }
}

#Preview {
    ContentView()
}
