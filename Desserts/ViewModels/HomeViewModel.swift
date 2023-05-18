//
//  HomeViewModel.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var allMeals: [Dessert]?
    @Published var searchText: String = ""
    private var cancellable: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    private var originalMeals: [Dessert]?
    
    init() {
        fetchAllDesserts()
    }
    
    func fetchAllDesserts() {
        cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
            .map { $0.data }
            .decode(type: Desserts.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { dessertData in
                self.originalMeals = dessertData.meals
                self.filterMeals()
            })
        
        $searchText
            .sink { [weak self] _ in
                self?.filterMeals()
            }
            .store(in: &cancellables)
    }
    

    
    
    private func filterMeals() {
        guard let originalMeals = originalMeals else {
            allMeals = nil
            return
        }
        
        if searchText.isEmpty {
            allMeals = originalMeals
        } else {
            let lowercasedText = searchText.lowercased()
            allMeals = originalMeals.filter { dessert in
                return dessert.name.lowercased().contains(lowercasedText)
            }
        }
    }
}
