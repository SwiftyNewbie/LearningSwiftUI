import SwiftUI

let gradientColors1: [Color] = [
    .gradient1,
    .gradient2
]

let gradientColors2: [Color] = [
    .gradient3,
    .gradient2
]

let gradientColors3: [Color] = [
    .gradient3,
    .gradient1
]

let backgroundGradients = [gradientColors1, gradientColors2, gradientColors3]

struct OnboardingFlowView: View {
    @State private var currentPage = 0

    private var currentBackground: Gradient {
        switch currentPage {
            case 0: Gradient(colors: gradientColors1)
            case 1: Gradient(colors: gradientColors2)
            case 2: Gradient(colors: gradientColors1)
            default: Gradient(colors: gradientColors1)
        }
    }

    var body: some View {
        TabView(selection: $currentPage) {
            WelcomePageView().tag(0)
            FeaturesPageView().tag(1)
            MyselfInSixWords().tag(2)
        }
        .tabViewStyle(.page)
        .background(currentBackground)
        .foregroundStyle(.white)
    }
}

#Preview {
    OnboardingFlowView()
}
