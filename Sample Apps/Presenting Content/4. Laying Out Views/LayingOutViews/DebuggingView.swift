import SwiftUI

struct DebuggingView: View {
    var body: some View {
        VStack {
            HalfCardView()
            HalfCardView()
                .rotationEffect(.degrees(180))
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black)
        )
        .aspectRatio(0.70, contentMode: .fit)
        .foregroundColor(.red)
        .padding()
    }
}

struct HalfCardView: View {
    var body: some View {
        VStack {
//            Spacer()
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        .border(.blue)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .overlay(alignment: .topLeading) {
            VStack {
                Image(systemName: "crown.fill")
                    .font(.body)
                Text("Q")
                    .font(.largeTitle)
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            .padding()
            .border(.red)
        }
        .border(.green)
    }
}

#Preview {
    DebuggingView()
}
