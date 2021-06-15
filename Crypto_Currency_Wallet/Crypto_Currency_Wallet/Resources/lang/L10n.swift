// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Open setting
  internal static var notInternetAction: String { L10n.tr("Localizable", "not_internet_action") }
  /// We can't reached our network right now.\n Please check your connection
  internal static var notInternetContent: String { L10n.tr("Localizable", "not_internet_content") }
  /// You are Offline
  internal static var notInternetTitle: String { L10n.tr("Localizable", "not_internet_title") }
  /// Something went wrong
  internal static var somethingWentWrong: String { L10n.tr("Localizable", "something_went_wrong") }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let languageCode = Language.sharedInstance.languageCode.rawValue
    guard let bundleMain = Bundle(identifier: "ch.resource.vn.Crypto-Currency-Wallet.test"), let path = bundleMain.path(forResource: languageCode, ofType: "lproj"),
      let bundle = Bundle(path: path) else {
        return NSLocalizedString(key, comment: "")
    }
    let defaultValue: String
    if let bundleMain = Bundle(identifier: "ch.resource.vn.Crypto-Currency-Wallet.test"), let path = bundleMain.path(forResource: LanguageCode.english.rawValue, ofType: "lproj"),
      let englishBundle = Bundle(path: path) {
      defaultValue = NSLocalizedString(key, tableName: table, bundle: englishBundle, comment: "")
    } else {
      defaultValue = NSLocalizedString(key, comment: "")
    }
    let format = NSLocalizedString(key, tableName: table, bundle: bundle, value: defaultValue, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
