//
//  Configuration.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Foundation

enum Configuration {
    static var baseURL: String {
        guard let url = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            fatalError("BASE_URL não encontrada")
        }
        return url
    }
}
