//
//  DessertRowView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct DessertRowView: View {
    
    @State var id: String
    @StateObject private var mealGenerator: DessertDetailViewModel
    
    init(id: String) {
        self._id = State(initialValue: id)
        self._mealGenerator = StateObject(wrappedValue: DessertDetailViewModel(id: id))
    }
    
    var body: some View {
        HStack {
            AsyncImageView(urlString: $mealGenerator.currentImageURL)
                .cornerRadius(10)
            
            Text(mealGenerator.currentMeal?.name ?? "")
                .font(.title)
            Spacer(minLength: 0)
        }
        .background(
            RoundedRectangle(cornerRadius: 13)
                .fill(Color.clear)
        )
        .frame(height: 55)
        .background(
            NavigationLink("", destination: DessertDetailsView(id: id)).opacity(0)
        )
    }
}

struct DessertRowView_Previews: PreviewProvider {
    static var previews: some View {
        DessertRowView(id: "53049")
    }
}
