//
//  LoginUseCaseTests.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import XCTest
@testable import Bank

final class LoginUseCaseTests: XCTestCase {
    var useCase: LoginUseCase!
    var mockRepository: MockAuthRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockAuthRepository()
        useCase = LoginUseCase(repository: mockRepository)
    }

    override func tearDown() {
        useCase = nil
        mockRepository = nil
        super.tearDown()
    }

    func test_login_success_shouldReturnToken() {
        // Given
        mockRepository.shouldSucceed = true
        mockRepository.returnedToken = "mock_token_123"
        let expectation = self.expectation(description: "Login Success")

        // When
        useCase.execute(email: "test@email.com", password: "123456") { result in
            // Then
            switch result {
            case .success(let response):
                XCTAssertEqual(response.token, "mock_token_123")
            case .failure:
                XCTFail("Expected success, got failure")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func test_login_failure_shouldReturnError() {
        // Given
        mockRepository.shouldSucceed = false
        mockRepository.errorToThrow = NSError(domain: "Login", code: 401)
        let expectation = self.expectation(description: "Login Failure")

        // When
        useCase.execute(email: "test@email.com", password: "wrongpass") { result in
            // Then
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error as NSError):
                XCTAssertEqual(error.domain, "Login")
                XCTAssertEqual(error.code, 401)
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}

