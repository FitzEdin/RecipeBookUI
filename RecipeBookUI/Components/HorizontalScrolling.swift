//
//  HorizontalScrolling.swift
//  RecipeBookUI
//
//  Created by Fitzroy Edinborough on 19/09/2023.
//

import SwiftUI

struct HorizontalScrolling: View {
    @ObservedObject var recipeManager: RecipeManager
    @State var selectedRecipe: Recipe? = nil
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(recipeManager.recipes.shuffled()) { recipe in
                    RecipeCard(recipe: recipe).onTapGesture {
                        selectedRecipe = recipe
                    }
                }
                .padding(.horizontal)
                
                .fullScreenCover(item: $selectedRecipe) { recipe in
                    RecipeDetailView(recipe: recipe)
                        .preferredColorScheme(.dark)
                }
            }
        }
    }
}
