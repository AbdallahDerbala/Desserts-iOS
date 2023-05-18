//
//  SearchBarView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchResults: String
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)
                .padding(.leading)
            TextField("Search for unique desserts...", text: $searchResults)
                .disableAutocorrection(true)
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding(10)
                        .foregroundColor(Color.pink)
                        .opacity(searchResults.isEmpty ? 0.0 : 0.7)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchResults = ""
                            vm.fetchAllDesserts()
                        }
                    ,
                    alignment: .trailing
                )
        }
        .font(.headline)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemBackground))
                .frame(height: 45)
                .shadow(color: Color.gray,radius: 3, x: 0, y: 0)
        )
        .padding(.vertical)
        .padding(.horizontal, 5)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchResults: .constant(""))
            .environmentObject(dev.desserts)
    }
}
