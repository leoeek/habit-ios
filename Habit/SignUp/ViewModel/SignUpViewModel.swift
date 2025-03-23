//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 30/01/25.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    private var cancellableSignUp: AnyCancellable?
    private var cancellableSignIn: AnyCancellable?
    private let interactor: SignUpInteractor
    
    @Published var uiState: SignUpUIState = .none
    
    init(interactor: SignUpInteractor) {
        self.interactor = interactor
    }
    
    deinit {
        cancellableSignUp?.cancel()
        cancellableSignIn?.cancel()
    }
    
    
    func signUp() {
        
        self.uiState = .loading
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateformatted = formatter.date(from: birthday)
        guard let dateFormatted = dateformatted else {
            self.uiState = .error("Data inválida \(birthday)")
            return
        }
        
        formatter.dateFormat = "yyyy-MM-dd"
        let birthday = formatter.string(from: dateFormatted)
        
        let signUpRequest = SignUpRequest(
            fullName: fullName,
            email: email,
            password: password,
            document: document,
            phone: phone,
            birthday: birthday,
            gender: gender.index
        )
        
        cancellableSignUp = interactor.postUser(singUpRequest: signUpRequest)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
                switch(completion) {
                    case .failure(let appErro):
                        self.uiState = .error(appErro.message)
                        break
                    case .finished:
                        break
                }
                
            } receiveValue: { created in

                if (created) {
                    self.cancellableSignIn = self.interactor.login(singInRequest: SignInRequest(email: self.email, password: self.password))
                        .receive(on: DispatchQueue.main)
                        .sink { completion in
                            switch(completion) {
                                case .failure(let appErro):
                                    self.uiState = .error(appErro.message)
                                    break
                                case .finished:
                                    break
                            }
                        } receiveValue: { successSignIn in
                            print(created)
                            self.publisher.send(created)
                            self.uiState = .success
                        }
                }
                
            }
        
//        interactor.postUser(
//            singUpRequest: signUpRequest
//        ) {
//            (successResponse, errorResponse) in
//            
//            if let error = errorResponse {
//                //Delegando para Main Thread
//                DispatchQueue.main.async {
//                    self.uiState = .error(error.detail)
//                }
//            }
//            
//            if let success = successResponse {
//                
////                WebService.login(
////                    request: SignInRequest(email: self.email, password: self.password)
////                ) {
////                    (successResponse, errorResponse) in
////                    
////                    if let errorSignIn = errorResponse {
////                        DispatchQueue.main.async {
////                            self.uiState = .error(errorSignIn.detail.message)
////                        }
////                    }
////                    
////                    if let successSignIn = successResponse {
////                        DispatchQueue.main.async {
////                            print(successSignIn)
////                            self.publisher.send(success)
////                            self.uiState = .success
////                        }
////                    }
////                }
//            }
//        }
        
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SingUpViewRouter.makeHomeView()
    }
}
