//
//  LoginDto.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct LoginDto: Codable {
    public let uuid: String?
    public let username: String?
    
    private enum CodingKeys: String, CodingKey {
        case uuid
        case username
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try? values.decodeIfPresent(String.self, forKey: .uuid)
        username = try? values.decodeIfPresent(String.self, forKey: .username)
    }
}
