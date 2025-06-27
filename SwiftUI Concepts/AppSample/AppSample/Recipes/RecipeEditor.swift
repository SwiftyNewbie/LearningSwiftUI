import SwiftUI

struct RecipeEditor: View {
    @Binding var config: RecipeEditorConfig

    var body: some View {
        NavigationStack {
            RecipeEditorForm(config: $config)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(editorTitle)
                    }

                    ToolbarItem(placement: cancelButtonPlacement) {
                        Button {
                            // The button actions could’ve explicitly set config.saveConfig and config.isPresented
                            // but keeping imperative code in an action to a minimum
                            // helps make the declarative interface code of the view more readable and easier to maintain
                            config.cancel()
                        } label: {
                            Text("Cancel")
                        }
                    }

                    ToolbarItem(placement: saveButtonPlacement) {
                        Button {
                            config.done()
                        } label: {
                            Text("Save")
                        }
                    }
                }
            #if os(macOS)
                .padding()
            #endif
        }
    }

    private var editorTitle: String {
        config.recipe.isNew ? "Add Recipe" : "Edit Recipe"
    }

    private var cancelButtonPlacement: ToolbarItemPlacement {
        #if os(macOS)
        .cancellationAction
        #else
        .navigationBarLeading
        #endif
    }

    private var saveButtonPlacement: ToolbarItemPlacement {
        #if os(macOS)
        .confirmationAction
        #else
        .navigationBarTrailing
        #endif
    }
}
