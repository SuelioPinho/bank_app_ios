//
//  MockLoginUseCase.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

@testable import Bank
import Foundation

class MockLoginUseCase: LoginUseCaseProtocol {
    var shouldSucceed = true
    var mockToken = "mock_token"
    var errorToThrow: Error?

    func execute(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        if shouldSucceed {
            completion(.success(LoginResponse(token: mockToken)))
        } else {
            completion(.failure(errorToThrow ?? NSError(domain: "MockError", code: -1)))
        }
    }
}
