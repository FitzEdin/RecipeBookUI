//
//  ContentView.swift
//  RecipeBookUI
//
//  Created by Fitzroy Edinborough on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RecipeView(recipeManager: RecipeManager())
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
