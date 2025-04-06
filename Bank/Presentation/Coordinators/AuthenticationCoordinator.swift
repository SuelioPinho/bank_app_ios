//
//  AuthenticationCoordinator.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import SwiftUI

struct AuthenticationCoordinator: View {
    @State private var path: [Route.Auth] = []

    var body: some View {
        NavigationStack(path: $path) {
            LoginView(navigationPath: $path)
                .navigationDestination(for: Route.Auth.self) { route in
                    switch route {
                    case .signUp:
                        SignUpView()
                    case .forgotPassword:
                        ForgotPasswordView()
                    }
                }
        }
    }
}
