//
//  EditTextView.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 01/02/25.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            else {
                TextField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundColor(.red)
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
        VStack {
            EditTextView(
                text: .constant("Texto aqui"),
                placeholder: "E-mail",
                error: "Campo inválido",
                failure: "a@a.com".count < 5
            )
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
