//
//  ContentView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    var body: some View {
        VStack {
            // Search Bar
            SearchBarView(searchResults: $vm.searchText)
            
            Spacer(minLength: 0)
            
            // List of Desserts
            List {
                ForEach(vm.allMeals ?? [], id: \.id) { (dessert: Dessert) in
                    DessertRowView(id: dessert.id)
                        .foregroundColor(Color("SecondaryTheme"))
                        .listRowBackground(Color("MainTheme"))
                }
                .foregroundColor(Color.black)
            }
            .listStyle(PlainListStyle())
            Spacer(minLength: 0)
        }
        .navigationTitle("Dessert Recipes 🍰")
        .navigationBarItems(
            leading: NavigationLink("Recents", destination: RecentDessertsView()),
            trailing: NavigationLink("Favorites", destination: FavoriteDessertsView()))
        .background(Color("MainTheme"))
        .foregroundColor(Color("SecondaryTheme"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
        .environmentObject(dev.desserts)
    }
}
