//
//  L10n.swift
//  OpenACExampleApp
//

import Foundation

enum L10n {
  /// Looks up a key in `Localizable.xcstrings` (supports runtime-composed keys such as `moica.<code>`).
  static func tr(_ key: String) -> String {
    String(localized: String.LocalizationValue(stringLiteral: key))
  }
}
