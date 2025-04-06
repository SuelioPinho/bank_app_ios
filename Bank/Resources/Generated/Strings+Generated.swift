// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Email
  internal static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// Digite seu e-mail
  internal static let emailPlaceholder = L10n.tr("Localizable", "email_placeholder", fallback: "Digite seu e-mail")
  /// Login
  internal static let loginButton = L10n.tr("Localizable", "login_button", fallback: "Login")
  /// Criar
  internal static let loginCreateAccount = L10n.tr("Localizable", "login_create_account", fallback: "Criar")
  /// Não possui uma conta?
  internal static let loginDontHaveAnAccount = L10n.tr("Localizable", "login_dont_have_an_account", fallback: "Não possui uma conta?")
  /// Esqueceu a senha?
  internal static let loginForgotYourPassword = L10n.tr("Localizable", "login_forgot_your_password", fallback: "Esqueceu a senha?")
  /// Boas-vindas!
  internal static let loginTitle = L10n.tr("Localizable", "login_title", fallback: "Boas-vindas!")
  /// Senha
  internal static let password = L10n.tr("Localizable", "password", fallback: "Senha")
  /// Digite sua senha
  internal static let passwordPlaceholder = L10n.tr("Localizable", "password_placeholder", fallback: "Digite sua senha")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
