//
//  CustomTextField.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

enum TextFieldType {
    case `default`, email, password
}

struct CustomTextField: View {
    var title: String
    var type: TextFieldType
    var placeholder: String
    
    @FocusState private var isFocused: Bool
    @Binding var text: String
    @Binding var error: String?
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Fonts.medium(size: 16))
                .foregroundColor(.white)
                .padding(.bottom, 4)
            
            ZStack(alignment: .leading) {
                textFieldView
                    .focused($isFocused)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Asset.Colors.textFieldColor.swiftUIColor)
                    .cornerRadius(8)
                    .frame(height: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isFocused ? Asset.Colors.primaryColor.swiftUIColor : Asset.Colors.textFieldColor.swiftUIColor, lineWidth: 2)
                    )
                
                if !isFocused && text.isEmpty {
                    placeholderText
                        .onTapGesture { isFocused = true }
                }
            }
            
            if (error != nil) {
                errorText
            }
        }
    }
    
    private var placeholderText: some View {
        Text(placeholder)
            .font(Fonts.regular(size: 16))
            .foregroundColor(Asset.Colors.placeholderColor.swiftUIColor)
            .padding(.leading, 16)
    }
    
    private var errorText: some View {
        Text(error ?? "")
            .foregroundStyle(.red)
            .font(Fonts.medium(size: 12))
            .padding(.top, 1)
    }
    
    private var textFieldView: some View {
        HStack {
            if type == .password {
                secureTextField
            } else {
                normalTextField
            }
            
            if type == .password {
                toggleSecureVisibilityButton
            }
        }
    }
    
    private var secureTextField: some View {
        Group {
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .textFieldStyle(PlainTextFieldStyle())
        .foregroundColor(.white)
        .accentColor(.white)
        .font(Fonts.semiBold(size: 16))
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled(true)
        .disableAutocorrection(true)
    }
    
    private var normalTextField: some View {
        TextField("", text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .foregroundColor(.white)
            .accentColor(.white)
            .keyboardType(type == .email ? .emailAddress : .default)
            .font(Fonts.semiBold(size: 16))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .disableAutocorrection(true)
    }
    
    private var toggleSecureVisibilityButton: some View {
        Button(action: { isSecure.toggle() }) {
            Image(systemName: isSecure ? "eye.slash" : "eye")
                .foregroundColor(.gray)
        }
        .padding(.leading, 8)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var defaultValue: String = ""
        @State private var emailError: String? = L10n.requiredField
        @State private var error: String?
        
        var body: some View {
            VStack(spacing: 20) {
                CustomTextField(title: L10n.email,
                                type: .email,
                                placeholder: L10n.emailPlaceholder, text: $email,
                                error: $emailError)
                .padding(.horizontal, 20)
                CustomTextField(title: L10n.password,
                                type: .password,
                                placeholder: L10n.passwordPlaceholder, text: $password,
                                error: $error)
                .padding(.horizontal, 20)
                CustomTextField(title: "Default",
                                type: .default,
                                placeholder: "Enter default", text: $defaultValue,
                                error: $error)
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Asset.Colors.backgroundColor.swiftUIColor)
        }
    }
    
    return PreviewWrapper()
}

