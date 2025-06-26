import SwiftUI

@main
struct ActuialApp {
    static func main() {
        SwiftUIApp.main()
    }
}


struct SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab {
                    ForecastView()
                } label: {
                    Label("Forecast", systemImage: "thermometer.sun.fill")
                }
                Tab {
                    MyselfInSixWords()
                } label: {
                    Label("Myself", systemImage: "6.square.fill")
                }
                Tab {
                    ChatBubblesView()
                } label: {
                    Label("Chat", systemImage: "bubble.fill")
                }
                Tab {
                    OnboardingFlowView()
                } label: {
                    Label("Onboarding", systemImage: "arrow.triangle.2.circlepath")
                }
                Tab {
                    DicesView()
                } label: {
                    Label("Dice", systemImage: "dice")
                }
            }
        }
    }
}

struct OnboardingApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingFlowView()
        }
    }
}
