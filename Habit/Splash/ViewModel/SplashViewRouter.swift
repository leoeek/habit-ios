//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSigInView() -> some View {
        let viewModel = SignInViewModel(interactor: SignInInteractor())
        return SignInView(viewModel: viewModel)
    }
    
}
