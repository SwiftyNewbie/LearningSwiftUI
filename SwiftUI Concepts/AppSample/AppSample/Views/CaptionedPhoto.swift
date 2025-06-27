import SwiftUI

struct CaptionedPhoto: View {
    var caption: String
    var image: String

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .overlay(alignment: .bottom) {
                    Caption(text: caption)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .padding()
        }
    }
}

struct Caption: View {
    let text: String

    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .padding()
            .background(.black.opacity(0.75),
                        in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
    }
}

#Preview {
    CaptionedPhoto(caption: "This photo is wider than it is tall", image: "Wave")
        .preferredColorScheme(.dark)
}
