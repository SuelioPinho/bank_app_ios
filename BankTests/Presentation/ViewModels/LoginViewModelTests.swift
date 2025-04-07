//
//  LoginViewModelTests.swift
//  Bank
//
//  Created by Suelio Sousa on 06/04/25.
//

import XCTest
@testable import Bank

final class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var mockUseCase: MockLoginUseCase!
    var mockAppState: AppState!

    override func setUp() {
        super.setUp()
        mockUseCase = MockLoginUseCase()
        mockAppState = AppState()
        viewModel = LoginViewModel(loginUseCase: mockUseCase, appState: mockAppState)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        mockAppState = nil
        super.tearDown()
    }

    func test_login_success_setsTokenInAppState() {
        // Given
        viewModel.email = "test@email.com"
        viewModel.password = "123456"
        mockUseCase.shouldSucceed = true
        mockUseCase.mockToken = "123456-token"

        // When
        let expectation = expectation(description: "Login Success")
        viewModel.login()

        // Wait briefly for async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Then
            XCTAssertEqual(self.mockAppState.token, "123456-token")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func test_login_failure_doesNotSetToken() {
        // Given
        viewModel.email = "fail@email.com"
        viewModel.password = "wrongpass"
        mockUseCase.shouldSucceed = false
        mockUseCase.errorToThrow = NSError(domain: "Login", code: 401)

        // When
        let expectation = expectation(description: "Login Failure")
        viewModel.login()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Then
            XCTAssertNil(self.mockAppState.token)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}
