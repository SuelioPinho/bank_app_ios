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
    @Published var token: String?

    private var cancellables = Set<AnyCancellable>()

    init() {
        token = KeychainHelper.shared.get(forKey: "authToken")

        $token
            .dropFirst() // evita execução imediata ao setar no init
            .sink { token in
                if let token = token {
                    KeychainHelper.shared.set(token, forKey: "authToken")
                } else {
                    KeychainHelper.shared.remove(forKey: "authToken")
                }
            }
            .store(in: &cancellables)
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
