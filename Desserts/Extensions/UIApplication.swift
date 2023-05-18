//
//  UIApplication.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
