//
//  AppEnvironment.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Swinject

final class AppEnvironment {
    static let shared = AppEnvironment()

    private(set) var assembler: Assembler!

    private init() {}

    func start(with appState: AppState) {
        assembler = Assembler([
            CoreAssembly(appState: appState),
            AuthAssembly()
        ])
    }
}
