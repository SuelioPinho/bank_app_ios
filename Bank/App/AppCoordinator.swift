//
//  AppCoordinator.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct AppCoordinator: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            if appState.isLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}
