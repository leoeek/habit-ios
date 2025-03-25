//
//  HomeViewRouter.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/03/25.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    
    static func makeHabitView() -> some View {
        let viewModel = HabitViewModel()
        return HabitView(viewModel: viewModel)
    }
    
}
