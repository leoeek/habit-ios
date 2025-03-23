//
//  SignInView.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    

    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View {
        
        if case SignInUIState.goToHomeScreen = viewModel.uiState {
            viewModel.homeView()
        }
        else {
            
            NavigationView {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .center, spacing: 20) {
                        
                        Spacer(minLength: 26)
                        
                        VStack(alignment: .center) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 48)
                            
                            Text("Login")
                                .foregroundColor(.orange)
                                .font(Font.system(.title).bold())
                                .padding(.bottom, 8)
                            
                            emailField
                            passwordField
                            enterButton
                            
                            registerLink
                            
                            Text("Copyright - Léo Dev")
                                .foregroundColor(Color.gray)
                                .font(Font.system(size: 16).bold())
                                .padding(.top, 16)
                        }
                        
                    }
                    
                    if case SignInUIState.error(let value) = viewModel.uiState {
                        Text("")
                            .alert(isPresented: .constant(true)) {
                                Alert(
                                    title: Text("Habit"),
                                    message: Text(value),
                                    dismissButton: .default(Text("OK")) {
                                    
                                    }
                                )
                            }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(navigationHidden)
            }
        }
    }
    
}

extension SignInView {
    var emailField: some View {
        EditTextView(
            text: $viewModel.email,
            placeholder: "E-mail",
            keyboard: .emailAddress,
            error: "e-mail inválido",
            failure: !viewModel.email.isEmail()
        )
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView(
            text: $viewModel.password,
            placeholder: "Senha",
            keyboard: .emailAddress,
            error: "senha deve ter ao menos 8 caracteres",
            failure: viewModel.password.count < 8,
            isSecure: true
        )
    }
}

extension SignInView {
    var enterButton: some View {
        LoadingButtonView(
            action: {
                viewModel.login()
            },
            text: "Entrar",
            showProgress: self.viewModel.uiState == SignInUIState.loading,
            disabled: !viewModel.email.isEmail() || viewModel.password.count < 8
        )
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possuí um login ativo?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            
            ZStack {
                NavigationLink(
                    destination: viewModel.singUpView(),
                    tag: 1,
                    selection: $action,
                    label: { EmptyView() }
                )
                
                Button("Realize o seu cadastro") {
                    self.action = 1
                }
            }
        }
    }
}

#Preview {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
}
