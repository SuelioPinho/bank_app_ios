//
//  CustomButton.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var backgroundColor: Color
    var textColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(Fonts.medium(size: 16))
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomButton(
            text: "Enviar",
            backgroundColor: Color.blue,
            textColor: Color.white,
            action: {
                print("Botão Enviar clicado")
            }
        )
        
        CustomButton(
            text: "Carregar",
            backgroundColor: Color.green,
            textColor: Color.white,
            action: {
                print("Botão Carregar clicado")
            }
        )
    }
    .padding()
}
