import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    @State private var dice = Dice()

    var columns: Int {
        switch numberOfPips {
        case 1...3:
            return numberOfPips
        case 4, 8:
            return 2
        case 16...20:
            return 4
        default:
            return 3
        }
    }

    var body: some View {
        VStack {
            Picker("Sides", selection: $dice.sides) {
                Text("4 Sides")
                    .tag(Dice.Sides.fourSides)
                Text("8 Sides")
                    .tag(Dice.Sides.eightSides)
                Text("12 Sides")
                    .tag(Dice.Sides.twelveSides)
                Text("20 Sides")
                    .tag(Dice.Sides.twentySides)
            }

            Button {
                rollDice()
            } label: {
                DiceImage(numberOfPips: numberOfPips,
                          sides: dice.sides,
                          gridColumnts: Array(repeating: GridItem(.fixed(12)), count: columns))
            }
            Button("Roll", action: rollDice)
            .buttonBorderShape(.capsule)
            .buttonStyle(.bordered)
        }
    }

    func rollDice() {
        withAnimation {
            numberOfPips = Int.random(in: 1...dice.sides.rawValue)
        }
    }
}



#Preview {
    DiceView()
}
