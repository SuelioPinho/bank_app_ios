//
//  LoginRequest.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
