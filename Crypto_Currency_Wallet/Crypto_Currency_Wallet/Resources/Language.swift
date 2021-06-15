//
//  Language.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 15/06/2021.
//

import Foundation

public protocol LanguageEvents: AnyObject {
    func languageDidChanged()
}

public enum LanguageCode: String, CaseIterable {
    case vietnamese = "vi"
    case english    = "en"

    public var description: String {
        switch self {
        case .english:
            return "English"
        case .vietnamese:
            return "Tiếng Việt"
        }
    }
}

public class Language: Multicastable {
    public static let sharedInstance = Language()
    public let multicast = Multicast<LanguageEvents>()
    
    public private(set) var languageCode: LanguageCode {
        get {
            if let language = UserDefaults.standard.string(forKey: AppConstant.languageCode) {
                return LanguageCode(rawValue: language) ?? .english
            }
            return LanguageCode(rawValue: Locale.current.languageCode ?? "en") ?? .english
        }
        set {
            guard languageCode != newValue else { return }
            UserDefaults.standard.setValue(newValue.rawValue, forKey: AppConstant.languageCode)
            NotificationCenter.default.post(
                name: .LanguageDidChanged,
                object: self,
                userInfo: nil)
            multicast.invokeMain {
                $0.languageDidChanged()
            }
        }
    }
    
    public func updateLanguageCode(_ languageCode: LanguageCode) {
        self.languageCode = languageCode
        // should save for next session
    }
}

extension Notification.Name {
    public static let LanguageDidChanged = Notification.Name("LanguageDidChanged")
}
