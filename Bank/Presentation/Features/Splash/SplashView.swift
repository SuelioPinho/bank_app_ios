//
//  SplashView.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

struct SplashView: View {
    private var logoSize: CGFloat = 300
    var body: some View {
        BaseView {
            VStack {
                Spacer()
                Image(Asset.Images.logo.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: logoSize, height: logoSize)
                Spacer()
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SplashView()
}
