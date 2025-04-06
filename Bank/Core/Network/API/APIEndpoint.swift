//
//  APIEndpoint.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Foundation

enum APIEndpoint {
    static let baseURL = "https://example.com"

    enum Auth {
        static var login: URL { URL(string: "\(baseURL)/login")! }
        static var register: URL { URL(string: "\(baseURL)/register")! }
        // Adicione mais conforme precisar
    }

    // Exemplo para usuários
    enum User {
        static var profile: URL { URL(string: "\(baseURL)/user/profile")! }
    }
}
