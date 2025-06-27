import Foundation

struct Recipe: Identifiable, Codable {
    var id: Int
    var title: String
    var rating: Int
    var prepTime: Int   // In seconds.
    var cookTime: Int   // In seconds.
    var servings: String
    var ingredients: String
    var directions: String
    var isFavorite: Bool
    var collections: [String]
    fileprivate var addedOn: Date? = Date()
    fileprivate var imageNames: [String]

    private static let newRecipeId: Recipe.ID = -1

    var isNew: Bool { id == Recipe.newRecipeId }
}

extension Recipe {
    static func emptyRecipe() -> Recipe {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")

        let json = """
            {
                "id": \(Recipe.newRecipeId),
                "title": "",
                "rating": 0,
                "prepTime": 0,
                "cookTime": 0,
                "servings": "",
                "ingredients": "",
                "directions": "",
                "isFavorite": false,
                "collections": [],
                "imageNames": []
            }
        """
        let data = Data(json.utf8)

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Recipe.self, from: data)
        } catch {
            fatalError("Invalid recipe JSON.")
        }
    }
}
