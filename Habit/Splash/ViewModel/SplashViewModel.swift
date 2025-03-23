//
//  SplashViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/01/25.
//

import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    private var cancellableAuth: AnyCancellable?
    
    private var interactor: SplahInteractor
    
    init(interactor: SplahInteractor) {
        self.interactor = interactor
    }
    
    deinit {
        cancellableAuth?.cancel()
    }
    
    func onAppear() {
        
        cancellableAuth = interactor.fetchAuth()
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .receive(on: DispatchQueue.main)
            .sink { userAuth in
                if (userAuth == nil) {
                    self.uiState = .goToSignInScreen
                }
                else if (Date().timeIntervalSince1970 > Date().timeIntervalSince1970 + Double(userAuth!.expires)) {
                    
                }
                else {
                    self.uiState = .goToHomeScreen
                }
                
            }
        
    }
    
}

extension SplashViewModel {
    func sigInView() -> some View {
        return SplashViewRouter.makeSigInView()
    }
}
