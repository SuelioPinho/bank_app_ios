//
//  AppCoordinator.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct AppCoordinator: View {
    @EnvironmentObject var appState: AppState
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                if appState.isLoggedIn {
                    MainView()
                } else {
                    AuthenticationCoordinator()
                }
            }
        }
    }
}
