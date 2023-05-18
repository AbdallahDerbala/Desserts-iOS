//
//  DessertDetailsViewModel.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation
import Combine

final class DessertDetailViewModel: ObservableObject {
    var id: String

    @Published var currentMeal: Dessert?
    @Published var currentImageURL: String?
    @Published var currentYoutubeURL: String?
    private var cancellable: AnyCancellable?

    init(id: String) {
        self.id = id
        fetchDessert()
    }

    func fetchDessert() {
        cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { data, _ in
                if let dessertData = try? JSONDecoder().decode(Desserts.self, from: data) {
                    self.currentMeal = dessertData.meals.first
                    self.currentImageURL = self.currentMeal?.imageURL
                    self.currentYoutubeURL = self.currentMeal?.youtubeURL
                }
            }
    }
}

