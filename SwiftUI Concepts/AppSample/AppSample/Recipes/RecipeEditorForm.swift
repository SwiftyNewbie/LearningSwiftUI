import SwiftUI

struct RecipeEditorForm: View {
    @Binding var config: RecipeEditorConfig

    var body: some View {
        Form {
            TextField("Recipe name", text: $config.recipe.title)
            Section {
                TextField(text: $config.recipe.servings, prompt: Text("4-6")) {
                    Text("Servings")
                }
            }
            Section("Ingredients") {
                TextEditor(text: $config.recipe.ingredients)
                    .modifier(MacSpecificModifiers())
            }
            Section("Directions") {
                TextEditor(text: $config.recipe.directions)
                    .modifier(MacSpecificModifiers())
            }
        }
    }
}

private struct MacSpecificModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
        #if os(macOS)
            .frame(height: 80)
            .border(.gray)
        #endif
    }
}
