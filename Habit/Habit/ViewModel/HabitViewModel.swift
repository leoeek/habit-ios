//
//  HabitViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/03/25.
//

import Foundation

class HabitViewModel: ObservableObject {
    
    @Published var uiState: HabitUIState = .emptyList
    
    @Published var title = "Atenção"
    @Published var headline = "Fique ligado!"
    @Published var desc = "Você está atrasado nos hábitos"
    
}
