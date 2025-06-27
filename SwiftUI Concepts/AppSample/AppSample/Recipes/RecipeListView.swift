import SwiftUI

struct RecipeListView: View {
    @State private var recipeEditorConfig = RecipeEditorConfig()

    var body: some View {
        NavigationStack {
            List {
                Text("Image that here is the list of recipes")
            }
            .navigationTitle(Text("Recipes"))
            .toolbar {
                ToolbarItem {
                    Button {
                        recipeEditorConfig.presentAddRecipe(inToTheCollection: nil)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $recipeEditorConfig.isPresented, onDismiss: didDismissEditor) {
                        RecipeEditor(config: $recipeEditorConfig)
                    }
                }
            }
        }
    }

    private func didDismissEditor() {
        if recipeEditorConfig.shouldSaveChanges {
            print(
                "Here is the "
                + "\(recipeEditorConfig.recipe.isNew ? "new" : "updated") "
                + "recipe: \(recipeEditorConfig.recipe)"
            )
        }
    }
}

#Preview {
    RecipeListView()
}
