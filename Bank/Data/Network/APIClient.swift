//
//  APIClient.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import Foundation
import Alamofire

class APIClient: APIClientProtocol {
    func request<T: Decodable>(
        endpoint: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(endpoint).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
