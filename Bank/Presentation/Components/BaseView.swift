//
//  BaseView.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct BaseView<Content: View>: View {
    let content: Content
    var showBackButton: Bool = false
    
    init(showBackButton: Bool = false, @ViewBuilder content: () -> Content) {
        self.showBackButton = showBackButton
        self.content = content()
    }
    
    var body: some View {
        content
            .background(Asset.Colors.backgroundColor.swiftUIColor)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Asset.Colors.backgroundColor.swiftUIColor, for: .navigationBar)
            .toolbar {
                if showBackButton {
                    ToolbarItem(placement: .navigationBarLeading) {
                        BackButton()
                    }
                }
            }
    }
}

