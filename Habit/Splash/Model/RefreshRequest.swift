//
//  RefreshRequest.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 23/03/25.
//

import Foundation

struct RefreshRequest: Encodable {
    
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "refresh_token"
    }
    
}
