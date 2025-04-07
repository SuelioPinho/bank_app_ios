//
//  LoginView.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct LoginView: View {
    @InjectedViewModel private var viewModel: LoginViewModel
    @Binding var navigationPath: [Route.Auth]
    
    var body: some View {
        BaseView {
            VStack {
                logoImage
                
                Spacer()
                    .frame(height: UIScreen.screenHeight * 0.05)
                
                inputFields
                
                forgotPasswordButton
                
                signInButton
                
                Spacer()
                
                signUpButton
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Subviews
    
    private var logoImage: some View {
        Image(Asset.Images.logo.name)
            .resizable()
            .scaledToFit()
            .frame(height: 70)
            .padding(.top, 40)
    }
    
    private var inputFields: some View {
        VStack {
            CustomTextField(
                title: L10n.email,
                type: .email,
                placeholder: L10n.emailPlaceholder,
                text: $viewModel.email,
                error: $viewModel.emailErrorMessage
            )
            
            CustomTextField(
                title: L10n.password,
                type: .password,
                placeholder: L10n.passwordPlaceholder,
                text: $viewModel.password,
                error: $viewModel.passwordErrorMessage
            )
            .padding(.top, 16)
        }
        .padding(.top, 70)
    }
    
    private var forgotPasswordButton: some View {
        Button(action: {
            navigationPath.append(.forgotPassword)
        }) {
            Text(L10n.loginForgotYourPassword)
                .foregroundColor(Asset.Colors.primaryColor.swiftUIColor)
                .font(Fonts.semiBold(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var signInButton: some View {
        CustomButton(
            text: L10n.loginButton,
            backgroundColor: Asset.Colors.primaryColor.swiftUIColor,
            textColor: .white,
            action: {
                viewModel.login()
            }
        )
        .padding(.top, 16)
    }
    
    private var signUpButton: some View {
        Button(action: {
            navigationPath.append(.signUp)
        }) {
            Text(viewModel.createButtonTitle)
                .foregroundStyle(.white)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    LoginView(navigationPath: .constant([]))
        .environmentObject(AppState())
}
