//
//  HomeViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
}

extension HomeViewModel {
    func habitView() -> some View {
        return HomeViewRouter.makeHabitView()
    }
}
