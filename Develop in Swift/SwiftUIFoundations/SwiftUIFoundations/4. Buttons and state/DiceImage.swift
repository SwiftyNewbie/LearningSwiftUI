import SwiftUI

struct DiceImage: View {
    var numberOfPips: Int
    var sides: Dice.Sides
    var gridColumnts: [GridItem]

    var body: some View {
        if sides == .fourSides {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.black, .white)
                LazyVGrid(columns: gridColumnts) {
                    ForEach(0..<numberOfPips, id: \.self) { _ in
                        Image(systemName: "circle.fill")
                            .foregroundStyle(.white)
                    }
                }.frame(maxWidth: 100, maxHeight: 100)
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()

        HStack {
            Spacer()

            ZStack {
                DiceImage(numberOfPips: 1, sides: .eightSides, gridColumnts: Array(repeating: GridItem(.fixed(12)), count: 1))
            }

            Spacer()
        }

        Spacer()
    }
        .background(.gray)
}
