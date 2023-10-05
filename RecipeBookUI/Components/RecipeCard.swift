//
//  RecipeCard.swift
//  RecipeBookUI
//
//  Created by Fitzroy Edinborough on 19/09/2023.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var body: some View {
        VStack {
            VStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 130)
                    .padding(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(recipe.headline)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(recipe.title)
                    .font(.title3).bold()
                
                Text(recipe.ingredients.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 40, alignment: .topLeading)
            }
        }
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe(
            title: "Grilled Chicken Salad",
            headline: "Lunch",
            ingredients: ["Chicken breasts", "Mixed greens", "Cherry tomatoes", "Cucumbers", "Balsamic vinaigrette"],
            instructions: "Start by grilling the chicken breasts until they are cooked through and have nice grill marks. While the chicken is cooking, prepare the salad by washing and drying the mixed greens, slicing the cherry tomatoes, and chopping the cucumbers. Once the chicken is done, let it rest for a few minutes before slicing it. In a large bowl, toss the greens, tomatoes, and cucumbers together. Place the sliced grilled chicken on top. Drizzle the balsamic vinaigrette over the salad. Toss everything together gently to combine. Your delicious and healthy grilled chicken salad is ready to be enjoyed!",
            imageName: "chicken")
        )
        .preferredColorScheme(.dark)
    }
}
