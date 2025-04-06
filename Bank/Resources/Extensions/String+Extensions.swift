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
        // Cria um AttributedString com o texto completo usando a fonte normal
        var attributedString = AttributedString(self)
        
        // Atribui a fonte normal
        attributedString.font = font
        
        // Loop através das partes que devem ser em negrito
        for boldPart in boldPartsOfString {
            // Encontra o intervalo da parte em negrito
            if let range = attributedString.range(of: boldPart) {
                // Aplica a fonte em negrito e a cor
                attributedString[range].font = boldFont
                attributedString[range].foregroundColor = boldColor
            }
        }
        
        return attributedString
    }
}
