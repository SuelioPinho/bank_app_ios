//
//  LoginViewModel.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var createButtonTitle: AttributedString = AttributedString("")
    
    init() {
        changeButtonTitle()
    }
    
    func changeButtonTitle() {
        let fullString = L10n.loginDontHaveAnAccount + " " + L10n.loginCreateAccount
        let boldParts = [L10n.loginCreateAccount]
        let font =  Fonts.medium(size: 16)
        let boldColor = Asset.Colors.primaryColor.swiftUIColor

        self.createButtonTitle = fullString.addBoldText(boldPartsOfString: boldParts, font: font, boldFont: font, boldColor: boldColor)
    }

//    let authRepository: AuthRepositoryProtocol
//    let appState: AppState
//
//    init(authRepository: AuthRepositoryProtocol = AuthRepository(), appState: AppState) {
//        self.authRepository = authRepository
//        self.appState = appState
//    }

    func login() {
        isLoading = true
        errorMessage = nil

//        authRepository.login(email: email, password: password) { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case .success(let token):
//                    self?.appState.login(with: token)
//                case .failure:
//                    self?.errorMessage = "Erro ao fazer login"
//                }
//            }
//        }
    }
}
