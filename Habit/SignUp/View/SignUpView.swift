//
//  SignUpView.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import SwiftUI

struct SignUpView: View {
    

    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .center) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cadastro")
                            .foregroundColor(Color("textColor"))
                            .font(Font.system(.title).bold())
                            .padding(.bottom, 8)
                        
                        fullNameField
                        emailField
                        passwordField
                        documentField
                        phoneField
                        birthdayField
                        genderField
                        saveButton
                    }
                    
                    Spacer()
                }.padding(.horizontal, 8)
                
            }.padding()
            
            if case SignUpUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("OK")) {
                            
                        })
                    }
            }
        }
        
    }
    
}

extension SignUpView {
    var fullNameField: some View {
        EditTextView(
            text: $viewModel.fullName,
            placeholder: "Entre com seu nome completo *",
            keyboard: .emailAddress,
            error: "Nome completo inválido",
            failure: viewModel.fullName.count < 3
        )
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(
            text: $viewModel.email,
            placeholder: "Entre com o seu E-mail *",
            keyboard: .alphabet,
            error: "e-mail inválido",
            failure: !viewModel.email.isEmail()
        )
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView(
            text: $viewModel.password,
            placeholder: "Entre com sua Senha *",
            keyboard: .emailAddress,
            error: "senha deve ter ao menos 8 caracteres",
            failure: viewModel.password.count < 8,
            isSecure: true
        )
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(
            text: $viewModel.document,
            placeholder: "Entre com seu CPF *",
            keyboard: .numberPad,
            error: "CPF inválido",
            failure: viewModel.document.count != 11
        )
    }
}

extension SignUpView {
    var phoneField: some View {
        EditTextView(
            text: $viewModel.phone,
            placeholder: "Entre com seu celular *",
            keyboard: .numberPad,
            error: "Entre com o DDD + 8 ou 9 digitos",
            failure: viewModel.phone.count < 10 || viewModel.phone.count >= 12
        )
    }
}

extension SignUpView {
    var birthdayField: some View {
        EditTextView(
            text: $viewModel.birthday,
            placeholder: "Entre com a data de nascimento *",
            keyboard: .numberPad,
            error: "Data deve ser no formato dd/MM/AAAA",
            failure: viewModel.birthday.count != 10
        )
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.top, 16)
        .padding(.bottom, 32)
    }
}

extension SignUpView {
    var saveButton: some View {
        LoadingButtonView(
            action: {
                viewModel.signUp()
            },
            text: "Realize o seu cadastro",
            showProgress: self.viewModel.uiState == SignUpUIState.loading,
            disabled: !viewModel.email.isEmail() ||
                viewModel.password.count < 8 ||
                viewModel.fullName.count < 3 ||
                viewModel.document.count != 11 ||
                viewModel.phone.count < 10 || viewModel.phone.count >= 12 ||
                viewModel.birthday.count != 10
        )
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
