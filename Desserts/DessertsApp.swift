//
//  DessertsApp.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

@main
struct DessertsApp: App {
    @StateObject var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
