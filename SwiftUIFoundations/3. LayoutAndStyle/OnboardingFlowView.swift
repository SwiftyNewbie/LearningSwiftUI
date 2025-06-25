import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct OnboardingFlowView: View {
    var body: some View {
        TabView {
            WelcomePageView()
            FeaturesPageView()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    OnboardingFlowView()
}
