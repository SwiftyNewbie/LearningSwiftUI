import SwiftUI

struct Badge: View {
    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader { geometry in
                badgeSymbol
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0,
                              y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()

    }

    var badgeSymbol: some View {
        ForEach(0 ..< 8) { item in
            RotatedBadgeSymbol(angle: .degrees(Double(item) / Double(8)) * 360.0)
                .opacity(0.5)
        }
    }
}

#Preview {
    Badge()
}
