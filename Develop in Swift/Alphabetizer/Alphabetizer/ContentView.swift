import SwiftUI

struct ContentView: View {
    @State var showSettingsView: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                HStack {
                    Spacer()
                    SettingsButton(triggered: $showSettingsView)
                }
                .padding(.horizontal)
                ScoreView()
            }
            MessageView()
            Spacer()
            WordCanvas()
            Spacer()
            SubmitButton()
        }
        .padding(.top, 50)
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
    }
}

#Preview {
    ContentView()
        .environment(Alphabetizer())
}
