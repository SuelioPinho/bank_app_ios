//
//  Untitled.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Swinject

final class AuthAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AuthRepositoryProtocol.self) { resolver in
            let apiClient = resolver.resolve(APIClientProtocol.self)!
            return AuthRepository(apiClient: apiClient)
        }

        container.register(LoginUseCaseProtocol.self) { resolver in
            let repository = resolver.resolve(AuthRepositoryProtocol.self)!
            return LoginUseCase(repository: repository)
        }

        container.register(LoginViewModel.self) { resolver in
            let useCase = resolver.resolve(LoginUseCaseProtocol.self)!
            let appState = resolver.resolve(AppState.self)!
            return LoginViewModel(loginUseCase: useCase, appState: appState)
        }
    }
}
