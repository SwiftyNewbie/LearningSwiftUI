import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3

    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions
    var hardMode = false
    var hideWords = false

    var masteryMode = false {
        didSet {
            if masteryMode {
                currentMasteryModeSet = .landAnimals
                leftMasteryModeSets = [.oceanAnimals]
            } else {
                currentMasteryModeSet = nil
                leftMasteryModeSets = []
            }
            currentMasteryConsecutiveWins = 0
            completedMasteryModeSets = []
            startNewGame()
        }
    }

    var currentMasteryModeSet: Vocabulary?
    var currentMasteryConsecutiveWins = 0
    var completedMasteryModeSets: [Vocabulary] = []
    var leftMasteryModeSets: [Vocabulary] = []

    private var attempts: Int = 0
    private var successed: Int = 0

    var winPercentage: Int? {
        attempts > 0 ? Int((Double(successed) / Double(attempts) * 100)) : nil
    }

    init() {
        startNewGame()
    }

    private var isAlphabetized = false

    /// Checks if tiles are in alphabetical order
    func submit() {
        attempts += 1
        // Check if the tiles are alphabetized
        let userSortedTiles = tiles.sorted { $0.position.x < $1.position.x }
        let alphabeticallySortedTiles = tiles.sorted { $0.word.lexicographicallyPrecedes($1.word) }

        isAlphabetized = userSortedTiles == alphabeticallySortedTiles

        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
            successed += 1
        }

        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        if hardMode && !isAlphabetized {
            score = 0
        }

        // Flip over correct tiles
        for (tile, corretTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == corretTile
            tile.flipped = tileIsAlphabetized
        }

        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))

            if masteryMode {
                if isAlphabetized {
                    currentMasteryConsecutiveWins += 1
                    if currentMasteryConsecutiveWins > 2 {
                        if let next = leftMasteryModeSets.first {
                            currentMasteryModeSet = next
                            leftMasteryModeSets.removeFirst()
                            completedMasteryModeSets.append(next)
                        } else {
                            currentMasteryModeSet = .landAnimals
                            leftMasteryModeSets = [.oceanAnimals]
                            completedMasteryModeSets = []
                        }
                        message = .instructions
                        currentMasteryConsecutiveWins = 0
                    }
                    startNewGame()
                } else {
                    currentMasteryConsecutiveWins = 0
                }
                message = .instructions
            } else {
                // If alphabetized, generate new tiles
                if isAlphabetized {
                    startNewGame()
                }

                // Display instructions
                message = .instructions
            }

            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
        }
    }

    // MARK: private implementation

    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let randomVocab: Vocabulary
        if let currentMasteryModeSet, masteryMode {
            randomVocab = currentMasteryModeSet
        } else {
            randomVocab = Bool.random() ? .landAnimals : .oceanAnimals
        }
        let newWords = randomVocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
    }
}
