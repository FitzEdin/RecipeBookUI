//
//  RecipeDetailView.swift
//  RecipeBookUI
//
//  Created by Fitzroy Edinborough on 20/09/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(recipe.imageName)
                        .resizable().scaledToFit()
                        .frame(maxHeight: 150).padding(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                }
                .background(.ultraThinMaterial).cornerRadius(15).padding()
                
                Text(recipe.headline).font(.title).bold().padding(.horizontal)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Instructions: ").font(.title3).bold().padding(.vertical, 5)
                        Text(recipe.instructions)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .frame(maxHeight: .infinity, alignment: .top).padding()
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients: ")
                            .font(.title3).bold().padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: -25) {
                                ForEach(Array(recipe.ingredients
                                    .enumerated()), id: \.element) { index, ingredient in
                                        Text(ingredient)
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(10)
                                            .background(.ultraThinMaterial)
                                            .cornerRadius(6)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(height: 100)
                    }
                }
                .frame(width: .infinity, height: 500, alignment: .bottomLeading)
                .background(.ultraThinMaterial)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            .background(.ultraThinMaterial)
            .navigationTitle(recipe.title)
            .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill").onTapGesture {
                dismiss()
            })
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(
            title: "Classic Margherita Pizza",
            headline: "Lunch",
            ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
            instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
            imageName: "pizza"))
        .preferredColorScheme(.dark)
    }
}
