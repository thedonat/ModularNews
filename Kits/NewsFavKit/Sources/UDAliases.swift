//
//  UDAliases.swift
//  NewsFavKit
//
//  Created by Burak Donat on 7/10/23.
//

import Foundation

public enum UDAliases: String {
    case favNewsID
}

public extension UserDefaults {

    @UserDefault(key: UDAliases.favNewsID.rawValue, defaultValue: [])

    static var favNewsID: [String]
}
