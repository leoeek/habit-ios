//
//  SignUpUIState.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 30/01/25.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
