//
//  SignInUIModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
