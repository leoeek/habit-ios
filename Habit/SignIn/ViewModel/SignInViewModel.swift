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
    private var cancellableRequest: AnyCancellable?
    
    private var publisher = PassthroughSubject<Bool, Never>()
    private var interactor: SignInInteractor
    
    @Published var uiState: SignInUIState = .none
    
    init(interactor: SignInInteractor) {
        self.interactor = interactor
        
        cancellable = publisher.sink { value in
            print("Usuário criado! goToHome: \(value)")
            
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
        cancellableRequest?.cancel()
    }
    
    func login() {
        self.uiState = .loading
        
        cancellableRequest = interactor.login(
            loginRequest: SignInRequest(email: email, password: password)
        )
        .receive(on: DispatchQueue.main)
        .sink { completion in
            
            //aqui acontece o ERRO ou FINISHED
            switch(completion) {
                case .failure(let appError):
                self.uiState = SignInUIState.error(appError.message)
                    break
                case .finished:
                    break
            }
            
            
        } receiveValue: { success in
            
            print(success)
            self.uiState = .goToHomeScreen
            
        }
        
//        interactor.login(
//            loginRequest: SignInRequest(email: email, password: password)
//        ) {
//            (successResponse, errorResponse) in
//            
//            if let erro = errorResponse {
//                DispatchQueue.main.async {
//                    self.uiState = .error(erro.detail.message)
//                }
//            }
//            
//            if let success = successResponse {
//                DispatchQueue.main.async {
//                    print(success)
//                    self.uiState = .goToHomeScreen
//                }
//            }
//        }
        
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


