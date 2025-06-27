import SwiftUI

enum TrainSymbol: String {
    case front = "train.side.front.car"
    case middle = "train.side.middle.car"
    case rear = "train.side.rear.car"
}

struct TrainCar: View {
    let position: TrainSymbol
    let showFrame: Bool

    init(_ position: TrainSymbol, showFrame: Bool = true) {
        self.position = position
        self.showFrame = showFrame
    }

    var body: some View {
        Image(systemName: position.rawValue)
            .background(Color.pink.opacity(0.2))
    }
}

struct TrainTrack: View {
    var body: some View {
        Divider()
            .frame(maxWidth: 200)
    }
}

struct DefaultSpacing: View {
    // The ScaledMetric property wrapper configures the trainCarSpace property to change in proportion to the current body font size
    @ScaledMetric var trainCarSpace = 5

    var body: some View {
        Text("Default Spacing")
        HStack(spacing: 5) {
            TrainCar(.rear)
                .opacity(0)
                .background(Color.green)
            Spacer() // This Spacer() between views pushes the content views as far apart as possible
            TrainCar(.middle)
                .padding(trainCarSpace)
                .background(Color.yellow)
            TrainCar(.front)
        }
        .padding()
        .background(Color.gray)
        TrainTrack()
    }
}


#Preview {
    DefaultSpacing()
}
