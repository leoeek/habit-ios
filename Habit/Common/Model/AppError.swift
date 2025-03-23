//
//  AppError.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 23/03/25.
//

import Foundation

enum AppError: Error {
    case response(message: String)
    
    public var message: String {
        switch self {
        case .response(let message):
            return message            
        }
    }
}
