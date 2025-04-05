//
//  CustomTextField.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

enum TextFieldType {
    case `default`
    case email
    case password
}

struct CustomTextField: View {
    var title: String
    var type: TextFieldType
    var placeholder: String
    
    @FocusState private var isFocused: Bool
    @Binding var text: String
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Fonts.medium(size: 16))
                .foregroundColor(.white)
                .padding(.bottom, 4)
            
            ZStack(alignment: .leading) {
                if !isFocused && text.isEmpty {
                    Text(placeholder)
                        .font(Fonts.regular(size: 16))
                        .foregroundColor(Asset.Colors.placeholderColor.swiftUIColor)
                        .onTapGesture {
                            isFocused = true
                        }
                }
                
                HStack {
                    if type == .password {
                        if isSecure {
                            SecureField("", text: $text)
                                .textFieldStyle(PlainTextFieldStyle())
                                .focused($isFocused)
                                .foregroundStyle(.white)
                                .accentColor(.white)
                                .font(Fonts.semiBold(size: 16))
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .disableAutocorrection(true)
                                .frame(maxWidth: .infinity)
                        } else {
                            TextField("", text: $text)
                                .textFieldStyle(PlainTextFieldStyle())
                                .focused($isFocused)
                                .foregroundStyle(.white)
                                .accentColor(.white)
                                .font(Fonts.semiBold(size: 16))
                                .autocorrectionDisabled(true)
                                .disableAutocorrection(true)
                        }
                    } else {
                        TextField("", text: $text)
                            .textFieldStyle(PlainTextFieldStyle())
                            .focused($isFocused)
                            .foregroundStyle(.white)
                            .accentColor(.white)
                            .keyboardType(type == .email ? .emailAddress : .default)
                            .font(Fonts.semiBold(size: 16))
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .disableAutocorrection(true)
                    }
                    
                    if type == .password {
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 8)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Asset.Colors.textFieldColor.swiftUIColor)
            .cornerRadius(8)
            .frame(height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Asset.Colors.primaryColor.swiftUIColor: Asset.Colors.textFieldColor.swiftUIColor, lineWidth: 2)
            )
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var defaultValue: String = ""

        var body: some View {
            VStack(spacing: 20) {
                CustomTextField(title: L10n.email,
                                type: .email,
                                placeholder: L10n.emailPlaceholder, text: $email)
                .padding(.horizontal, 20)
                CustomTextField(title: L10n.password,
                                type: .password,
                                placeholder: L10n.passwordPlaceholder, text: $password)
                .padding(.horizontal, 20)
                CustomTextField(title: "Default",
                                type: .default,
                                placeholder: "Digite seu default", text: $defaultValue)
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Asset.Colors.backgroundColor.swiftUIColor)
        }
    }

    return PreviewWrapper()
}
