import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 4

    var body: some View {
        VStack {
            Button {
                rollDice()
            } label: {
                Image(systemName: "die.face.\(numberOfPips).fill")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.black, .white)
            }
            Button("Roll", action: rollDice)
            .buttonBorderShape(.capsule)
            .buttonStyle(.bordered)
        }
    }

    func rollDice() {
        withAnimation {
            numberOfPips = Int.random(in: 1...6)
        }
    }
}

#Preview {
    DiceView()
}
