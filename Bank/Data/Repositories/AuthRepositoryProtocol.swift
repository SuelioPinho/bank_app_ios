//
//  AuthRepositoryProtocol.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

protocol AuthRepositoryProtocol {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
}
