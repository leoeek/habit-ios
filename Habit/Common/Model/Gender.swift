//
//  Gener.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 30/01/25.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case famale = "Feminino"
    
    var id: String {
        self.rawValue
    }
    
    var index: Self.AllCases.Index {
        return Self.allCases.firstIndex { self == $0 } ?? 0
    }
}
