//
//  LoginViewModel.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet {
            clearEmailError()
        }
    }
    @Published var password: String = "" {
        didSet {
            clearPasswordError()
        }
    }
    @Published var emailErrorMessage: String?
    @Published var passwordErrorMessage: String?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var createButtonTitle: AttributedString = AttributedString("")
    
    private let loginUseCase: LoginUseCaseProtocol
    private let appState: AppState
    
    init(
        loginUseCase: LoginUseCaseProtocol = LoginUseCase(repository: AuthRepository()),
        appState: AppState
    ) {
        self.loginUseCase = loginUseCase
        self.appState = appState
        changeButtonTitle()
    }
    
    
    func changeButtonTitle() {
        let fullString = L10n.loginDontHaveAnAccount + " " + L10n.loginCreateAccount
        let boldParts = [L10n.loginCreateAccount]
        let font =  Fonts.medium(size: 16)
        let boldColor = Asset.Colors.primaryColor.swiftUIColor
        
        self.createButtonTitle = fullString.addBoldText(boldPartsOfString: boldParts, font: font, boldFont: font, boldColor: boldColor)
    }
    
    func validateFields() -> Bool {
        emailErrorMessage = FieldValidator.validateEmail(email)
        passwordErrorMessage = FieldValidator.validateNotEmpty(password)
        
        return emailErrorMessage == nil && passwordErrorMessage == nil
    }
    
    func clearEmailError() {
        emailErrorMessage = nil
    }
    
    func clearPasswordError() {
        passwordErrorMessage = nil
    }
    
    func login() {
        if !validateFields() {
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        loginUseCase.execute(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.appState.login(with: response.token)
                case .failure:
                    self?.errorMessage = "Erro ao fazer login"
                }
            }
        }
    }
}
