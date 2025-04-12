//
//  String+Extensions.swift
//  Bank
//
//  Created by Suelio Sousa on 05/04/25.
//

import UIKit
import SwiftUI

extension String {
    func addBoldText(boldPartsOfString: [String], font: SwiftUI.Font, boldFont: SwiftUI.Font, boldColor: Color) -> AttributedString {
        var attributedString = AttributedString(self)
        
        attributedString.font = font
        
        for boldPart in boldPartsOfString {
            if let range = attributedString.range(of: boldPart) {
                attributedString[range].font = boldFont
                attributedString[range].foregroundColor = boldColor
            }
        }
        
        return attributedString
    }
}
