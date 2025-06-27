import SwiftUI

struct IfElseTrain: View {
    var longerTrain: Bool
    var veryLongerTrain: Bool

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "train.side.rear.car")
                if longerTrain {
                    Image(systemName: "train.side.middle.car")
                }
                Image(systemName: "train.side.middle.car")
                    .opacity(veryLongerTrain ? 1 : 0)
                Image(systemName: "train.side.front.car")
            }
            Divider()
        }
    }
}

#Preview {
    IfElseTrain(longerTrain: true, veryLongerTrain: true)
    IfElseTrain(longerTrain: true, veryLongerTrain: false)
    IfElseTrain(longerTrain: false, veryLongerTrain: false)
}
