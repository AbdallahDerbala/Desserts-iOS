//
//  FavoriteDessertsView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct FavoriteDessertsView: View {
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        VStack {
            // Search Bar
            SearchBarView(searchResults: $vm.searchText)
            
            Spacer(minLength: 0)
            
            // List of Desserts
            List {
                ForEach(vm.allMeals ?? [], id: \.id) { (dessert: Dessert) in
                    if dessert.isFavorite() {
                        DessertRowView(id: dessert.id)
                            .background(NavigationLink("", destination: DessertDetailsView(id: dessert.id)).opacity(0))
                    }
                }
            }
            
            Spacer(minLength: 0)
            
        }
        .navigationTitle("Favorites")
    }
}

struct FavoriteDessertsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavoriteDessertsView()
        }
        .environmentObject(dev.desserts)
    }
}
