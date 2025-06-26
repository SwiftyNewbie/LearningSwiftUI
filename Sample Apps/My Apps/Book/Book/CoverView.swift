import SwiftUI

struct CoverView: View {
    var body: some View {
        VStack {
            Text("NewBie Publishing Inc.")
                .font(.caption)
                .fontDesign(.monospaced)

            Spacer()

            Text("How To Learn SwiftUI in 24 Hours")
                .font(.largeTitle)
                .fontWeight(.black)
                .fontDesign(.serif)
                .multilineTextAlignment(.center)

            Spacer()

            Image(systemName: "book")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)

            Spacer()

            Text("by")
                .font(.subheadline)

            Text("John Appleseed")
                .font(.title2)

            Spacer()

            Text("2025")
                .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    CoverView()
}
