//
//  APIEndpoint.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Foundation

enum APIEndpoint {
    private static func createURL(for path: String) -> URL {
        guard let url = URL(string: "\(Configuration.baseURL)\(path)") else {
            fatalError("URL inválida para o caminho: \(path)")
        }
        return url
    }
    
    enum Auth {
        static var login: URL { createURL(for: "/login") }
        static var register: URL { createURL(for: "/register") }
    }
    
    enum User {
        static var profile: URL { createURL(for: "/user/profile") }
    }
}
