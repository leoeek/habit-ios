//
//  CustomTextFieldStyle.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 01/02/25.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 10)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.orange, lineWidth: 0.8)
            )
    }
}
