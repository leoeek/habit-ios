//
//  SignInErrorResponse.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 23/03/25.
//

import Foundation

struct SignInErrorResponse: Decodable {
    
    let detail: SignInDetailErrorResponse

    enum CodingKeys: String, CodingKey {
        case detail
    }
    
}

struct SignInDetailErrorResponse: Decodable {
    
    let message: String
    
    enum CodigKeys: String, CodingKey {
        case message
    }
}
