//
//  NameModel.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct NameModel: Decodable, CustomStringConvertible {
    public let firstName: String?
    public let lastName: String?
    
    public init(firstName: String?, lastName: String?) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    public var description: String {
        return "NameModel(firstName: \(firstName ?? ""), lastName: \(lastName ?? ""))"
    }
    
}
