//
//  ErrorResponse.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 23/02/25.
//

import Foundation

struct ErrorResponse: Decodable {
    
    let detail: String

    enum CodingKeys: String, CodingKey {
        case detail
    }
    
}
