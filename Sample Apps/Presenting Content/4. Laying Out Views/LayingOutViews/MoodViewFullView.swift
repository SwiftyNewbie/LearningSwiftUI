import SwiftUI

struct MoodViewFullView: View {
    @State var value: String = ""
    private let emojis = ["😄", "😃", "😀", "😔", "😕"]
    var body: some View {
        VStack {
            Text("What's your mood?")
                .foregroundStyle(.darkBrown)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Button {
                        value = emoji
                    } label: {
                        VStack {
                            Text(emoji)
                                .font(.system(size: 32))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom)
                            Image(systemName: value == emoji ? "circle.fill" : "circle")
                                .font(.system(size: 16))
                                .foregroundStyle(.darkBrown)
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.paleOrange)
                .shadow(color: .gray, radius: 4)
        }

    }
}

#Preview {
    MoodViewFullView()
}
