import SwiftUI

struct StarRating: View {
    @Binding var rating: Int
    private let maxRating = 5

    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundStyle(.teal)
                    .onTapGesture {
                        rating = value != rating ? value : 0
                    }
            }
        }
    }
}

struct StarRatingTest: View {
    @State var rating: Int = 0

//    private var recipe: Binding<Recipe> {
//        Binding {
//            if let id = recipeId {
//                return recipeBox.recipe(with: id) ?? Recipe.emptyRecipe()
//            } else {
//                return Recipe.emptyRecipe()
//            }
//        } set: { updatedRecipe in
//            recipeBox.update(updatedRecipe)
//        }
//    }

    var body: some View {
        VStack {
            Text("Some recipe")
                .padding(.bottom, 4)
            StarRating(rating: $rating)
        }
    }
}

#Preview {
    StarRatingTest()
}
