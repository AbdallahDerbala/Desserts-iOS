//
//  RecentDessertsView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct RecentDessertsView: View {
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        VStack {
            // Search Bar
            SearchBarView(searchResults: $vm.searchText)
            
            Spacer(minLength: 0)
            
            // List of Desserts
            List {
                ForEach(vm.allMeals ?? [], id: \.id) { (dessert: Dessert) in
                    if dessert.isrecent() {
                        DessertRowView(id: dessert.id)
                            .background(NavigationLink("", destination: DessertDetailsView(id: dessert.id)).opacity(0))
                    }
                }
                .onDelete (perform: deleteItems)
            }
            
            Spacer(minLength: 0)
            
        }
        .navigationTitle("Recents")
        .navigationBarItems(trailing: EditButton())
    }
    
    func deleteItems(at offsets: IndexSet) {
        if let index = offsets.first {
            if let dessert = vm.allMeals?[index] {
                dessert.clearRecent()
            }
        }
        vm.fetchAllDesserts()
    }
}

struct RecentDessertsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecentDessertsView()
        }
        .environmentObject(dev.desserts)
    }
}
