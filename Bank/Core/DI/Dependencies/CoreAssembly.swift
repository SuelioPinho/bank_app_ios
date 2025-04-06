//
//  CoreAssembly.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Swinject

final class CoreAssembly: Assembly {
    private let appState: AppState

    init(appState: AppState) {
        self.appState = appState
    }

    func assemble(container: Container) {
        container.register(APIClientProtocol.self) { _ in
            APIClient()
        }.inObjectScope(.container)

        container.register(AppState.self) { _ in
            self.appState
        }.inObjectScope(.container)
    }
}
