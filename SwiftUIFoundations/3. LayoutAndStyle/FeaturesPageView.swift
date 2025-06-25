import SwiftUI

struct FeaturesPageView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text("Features")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom)
                .padding(.top, 100)

            FeatureCard(iconName: "person.2.crop.square.stack.fill",
                        description: "A multiline description about a feature paired with the image on the left.")

            FeatureCard(iconName: "square.and.arrow.up.on.square.fill",
                        description: "Short summary.")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    FeaturesPageView()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors1))
        .foregroundStyle(.white)
}
