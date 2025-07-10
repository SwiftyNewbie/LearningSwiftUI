struct Dice {
    enum Sides: Int {
        case fourSides = 4
        case eightSides = 8
        case twelveSides = 12
        case twentySides = 20
    }

    var sides: Sides = .eightSides
}
