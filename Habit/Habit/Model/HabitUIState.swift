//
//  HaibtUIState.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/03/25.
//

import Foundation

enum HabitUIState: Equatable {
    case loading
    case emptyList
    case fullList
    case error(String)
}
