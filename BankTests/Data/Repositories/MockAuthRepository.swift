//
//  MockAuthRepository.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//
@testable import Bank
import Foundation

final class MockAuthRepository: AuthRepositoryProtocol {
    var shouldSucceed = true
    var returnedToken = "fake_token_123"
    var errorToThrow: Error = NSError(domain: "LoginError", code: -1)

    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        if shouldSucceed {
            let response = LoginResponse(token: returnedToken)
            completion(.success(response))
        } else {
            completion(.failure(errorToThrow))
        }
    }
}
