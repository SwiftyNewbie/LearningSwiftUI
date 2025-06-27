import Foundation

struct RecipeEditorConfig {
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
    var isPresented = false

    mutating func presentAddRecipe(inToTheCollection name: String?) {
        recipe = Recipe.emptyRecipe()

        if let name = name {
            recipe.collections = [name]
        } else {
            recipe.isFavorite = true
        }

        shouldSaveChanges = false
        isPresented = true
    }

    mutating func presentEditRecipe(_ recipeToEdit: Recipe) {
        recipe = recipeToEdit
        shouldSaveChanges = false
        isPresented = true
    }

    mutating func done() {
        shouldSaveChanges = true
        isPresented = false
    }

    mutating func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}
