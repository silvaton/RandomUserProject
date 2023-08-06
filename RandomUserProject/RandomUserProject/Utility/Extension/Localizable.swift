//
//  Localizable.swift
//  RandomUserProject
//
//  Created by Ton Silva on 6/8/23.
//

import SwiftUI

// MARK: - Localizable
protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
