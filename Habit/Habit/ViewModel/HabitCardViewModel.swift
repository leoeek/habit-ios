//
//  HabitCardViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 21/05/25.
//

import Foundation
import SwiftUI

struct HabitCardViewModel: Identifiable, Equatable {
    
    var id: Int = 0
    var icon: String = ""
    var date: String = ""
    var name: String = ""
    var label: String = ""
    var value: String = ""
    var state: Color = .green
    
    static func == (lhs: HabitCardViewModel, rhs: HabitCardViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
