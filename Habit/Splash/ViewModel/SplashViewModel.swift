//
//  SplashViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/01/25.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.uiState = .goToSignInScreen
            self.uiState = .goToSignInScreen
        }
    }
    
}

extension SplashViewModel {
    func sigInView() -> some View {
        return SplashViewRouter.makeSigInView()
    }
}
