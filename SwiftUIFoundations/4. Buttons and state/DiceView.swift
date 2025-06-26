import SwiftUI

struct DicesView: View {
    @State private var numberOfDice: Int = 2

    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle
                    .lowercaseSmallCaps()
                    .monospaced()
                )
                .foregroundStyle(.white)

            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }

            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)

                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
            }
            .labelStyle(.iconOnly)
            .font(.title)
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.diceBackground)
        .tint(.white)
    }
}

struct DiceView: View {
    @State private var numberOfPips: Int = 4

    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)

            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DicesView()
}
