//
//  NameDto.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct NameDto: Codable {
    public let first: String?
    public let last: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case first
        case last
    }
    
    public init(first: String?,
                last: String?) {
        self.first = first
        self.last = last
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first = try values.decodeIfPresent(String.self, forKey: .first)
        last = try values.decodeIfPresent(String.self, forKey: .last)
    }
}
