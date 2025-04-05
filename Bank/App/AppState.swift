//
//  AppState.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import Foundation
import Combine
import Security

class AppState: ObservableObject {
    @Published var token: String? = KeychainHelper.shared.get(forKey: "authToken") {
        didSet {
            if let token = token {
                KeychainHelper.shared.set(token, forKey: "authToken")
            } else {
                KeychainHelper.shared.remove(forKey: "authToken")
            }
        }
    }

    var isLoggedIn: Bool {
        token != nil
    }

    func logout() {
        token = nil
    }

    func login(with token: String) {
        self.token = token
    }
}
