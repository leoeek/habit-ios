//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 30/01/25.
//

import SwiftUI

enum SingUpViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
