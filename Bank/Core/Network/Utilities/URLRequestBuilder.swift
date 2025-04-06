//
//  URLRequestBuilder.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import Foundation

struct URLRequestBuilder {
    static func makeRequest(
        url: URL,
        method: String,
        body: Encodable? = nil,
        headers: [String: String] = ["Content-Type": "application/json"]
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method

        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        if let body = body {
            request.httpBody = try? JSONEncoder().encode(AnyEncodable(body))
        }

        return request
    }
}
