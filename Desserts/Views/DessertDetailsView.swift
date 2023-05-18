//
//  DessertDetailsView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct DessertDetailsView: View {
    @State var id: String
    @StateObject private var mealGenerator: DessertDetailViewModel
    
    init(id: String) {
        self._id = State(initialValue: id)
        self._mealGenerator = StateObject(wrappedValue: DessertDetailViewModel(id: id))
    }

    var body: some View {
        ScrollView {
            VStack {
                if let name = mealGenerator.currentMeal?.name {
                    HStack {
                        Spacer()
                        Text(name)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23)
                            .foregroundColor(mealGenerator.currentMeal?.isFavorite() ?? false ? Color.pink : Color.black)
                            .onTapGesture {
                                mealGenerator.currentMeal?.toggleFavorite()
                            }
                    }
                    .onAppear{ mealGenerator.currentMeal?.setRecent() }
                }
                AsyncImageView(urlString: $mealGenerator.currentImageURL)
                
                if mealGenerator.currentMeal?.youtubeURL.isEmpty ?? true { } else {
                    if let youtubeURL = URL(string: mealGenerator.currentMeal?.youtubeURL ?? "") {
                        Link("Youtube Video", destination: youtubeURL)
                    }
                }
                
                if let ingredients = mealGenerator.currentMeal?.ingredients {
                    HStack {
                        Text("Ingredients")
                            .font(.title2)
                            .padding(.top)
                        Spacer()
                    }
                    ForEach(ingredients, id: \.self) { ingredient in
                        HStack {
                            Text(ingredient.name + " - " + ingredient.measure)
                            Spacer()
                        }
                    }
                }
                if let instructions = mealGenerator.currentMeal?.instructions {
                    HStack {
                        Text("Instructions")
                            .font(.title2)
                            .padding(.top)
                        Spacer()
                    }
                    Text(instructions)
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .padding(.bottom, 10)
        }
        .background(
            Color("MainTheme")
        )
    }
}

struct DessertDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsView(id: "53049")
    }
}
