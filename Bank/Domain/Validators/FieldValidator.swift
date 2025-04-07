//
//  FieldValidator.swift
//  Bank
//
//  Created by Suelio Sousa on 07/04/25.
//

import Foundation

class FieldValidator {
    
    enum ValidationError {
        case emptyField
        case invalidEmail
        
        var message: String {
            switch self {
            case .emptyField:
                return L10n.requiredField
            case .invalidEmail:
                return L10n.invalidEmail
            }
        }
    }
    
    static func validateNotEmpty(_ value: String) -> String? {
        return value.isEmpty ? ValidationError.emptyField.message : nil
    }
    
    static func validateEmail(_ email: String) -> String? {
        if let error = validateNotEmpty(email) {
            return error
        } else if !isValidEmail(email) {
            return ValidationError.invalidEmail.message
        }
        return nil
    }
    
    static func validatePassword(_ password: String) -> String? {
        return validateNotEmpty(password)
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", RegexPattern.email).evaluate(with: email)
    }
}
