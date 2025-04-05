//
//  Fonts.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import SwiftUI

enum Fonts {
    static func regular(size: CGFloat) -> SwiftUI.Font {
        return FontFamily.Inter.regular.swiftUIFont(size: size)
    }
    
    static func bold(size: CGFloat) -> SwiftUI.Font {
        return FontFamily.Inter.bold.swiftUIFont(size: size)
    }
    
    static func semiBold(size: CGFloat) -> SwiftUI.Font {
        return FontFamily.Inter.semiBold.swiftUIFont(size: size)
    }
    
    static func medium(size: CGFloat) -> SwiftUI.Font {
        return FontFamily.Inter.medium.swiftUIFont(size: size)
    }
}
