//
//  BankApp.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

@main
struct BankApp: App {
    @StateObject private var appState = AppState()
    
    init() {
        // NavigationBar Global Settings
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: Asset.Colors.backgroundColor.name)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        // Sets the style of the Status Bar
        let statusBarAppearance = UINavigationBarAppearance()
        statusBarAppearance.configureWithOpaqueBackground()
        statusBarAppearance.backgroundColor = UIColor(named: Asset.Colors.backgroundColor.name)
        UINavigationBar.appearance().standardAppearance = statusBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = statusBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            AppCoordinator()
                .environmentObject(appState)
        }
    }
}
