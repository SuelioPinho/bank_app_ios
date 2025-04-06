//
//  CardView.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import SwiftUI

struct CardView<Content: View>: View {
    var backgroundColor: Color
    var content: Content
    var cornerRadius: CGFloat = 8
    
    init(backgroundColor: Color, @ViewBuilder content: () -> Content) {
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    var body: some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(radius: 3)
    }
}

#Preview {
    CardView(backgroundColor: Asset.Colors.primaryColor.swiftUIColor) {
        VStack(alignment: .leading) {
            Text("CardView")
                .foregroundStyle(Color.white)
                .font(Fonts.medium(size: 16))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
    .padding()
}
