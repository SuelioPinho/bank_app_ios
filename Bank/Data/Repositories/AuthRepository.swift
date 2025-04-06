//
//  AuthRepository.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

class AuthRepository: AuthRepositoryProtocol {
    let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let body = LoginRequest(email: email, password: password)
        let request = URLRequestBuilder.makeRequest(
            url: APIEndpoint.Auth.login,
            method: "POST",
            body: body
        )

        apiClient.request(endpoint: request) { (result: Result<LoginResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
