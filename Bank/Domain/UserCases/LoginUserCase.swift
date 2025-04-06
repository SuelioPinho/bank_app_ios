//
//  LoginUserCase.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

protocol LoginUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
}

class LoginUseCase: LoginUseCaseProtocol {
    private let repository: AuthRepositoryProtocol

    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }

    func execute(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        repository.login(email: email, password: password, completion: completion)
    }
}
