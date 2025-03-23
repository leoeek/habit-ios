//
//  SignInViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    private var cancellable: AnyCancellable?
    private var publisher = PassthroughSubject<Bool, Never>()
    
    @Published var uiState: SignInUIState = .none
    
    init() {
        cancellable = publisher.sink { value in
            print("Usuário criado! goToHome: \(value)")
            
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func login() {
        self.uiState = .loading
        
        WebService.login(
            request: SignInRequest(email: email, password: password)
        ) {
            (successResponse, errorResponse) in
            
            if let erro = errorResponse {
                DispatchQueue.main.async {
                    self.uiState = .error(erro.detail.message)
                }
            }
            
            if let success = successResponse {
                DispatchQueue.main.async {
                    print(success)
                    self.uiState = .goToHomeScreen
                }
            }
        }
    }
    
}

extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    
    func singUpView() -> some View {
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}


