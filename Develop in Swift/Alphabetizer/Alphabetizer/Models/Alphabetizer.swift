import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3

    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions

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

        // Flip over correct tiles
        for (tile, corretTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == corretTile
            tile.flipped = tileIsAlphabetized
        }

        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))

            // If alphabetized, generate new tiles
            if isAlphabetized {
                startNewGame()
            }

            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }

            // Display instructions
            message = .instructions
        }
    }

    // MARK: private implementation

    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let randomVocab: Vocabulary = Bool.random() ? .landAnimals : .oceanAnimals
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
