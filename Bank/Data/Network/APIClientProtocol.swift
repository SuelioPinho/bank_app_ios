//
//  APIClientProtocol.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(
        endpoint: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
