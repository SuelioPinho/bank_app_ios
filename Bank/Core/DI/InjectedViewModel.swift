//
//  InjectedViewModel.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import SwiftUI
import Swinject

@propertyWrapper
struct InjectedViewModel<T: ObservableObject>: DynamicProperty {
    @StateObject private var viewModel: T

    init() {
        guard let resolved = AppEnvironment.shared.assembler?.resolver.resolve(T.self) else {
            fatalError("Não foi possível resolver \(T.self)")
        }
        _viewModel = StateObject(wrappedValue: resolved)
    }

    var wrappedValue: T {
        viewModel
    }

    var projectedValue: ObservedObject<T>.Wrapper {
        $viewModel
    }
}
