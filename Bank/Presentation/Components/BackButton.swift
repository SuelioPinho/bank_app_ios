//
//  BackButton.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    var iconName: String = Asset.Images.back.name
    var size: CGFloat = 24

    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        }
    }
}
