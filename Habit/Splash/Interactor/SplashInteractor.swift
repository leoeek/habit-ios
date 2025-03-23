//
//  SplashInteractor.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 23/03/25.
//

import Foundation
import Combine

class SplahInteractor {
    
    private let local: LocalDataSource = .shared
    
}

extension SplahInteractor {
    
    func fetchAuth() -> Future<UserAuth?, Never> {
        return local.getUserAuth()
    }
    
}
