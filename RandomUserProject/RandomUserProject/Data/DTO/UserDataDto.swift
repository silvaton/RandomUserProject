//
//  UserDataDto.swift.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct UserDataDto: Decodable {
    public var data: UserResponseDto?
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
    
    public init(data: UserResponseDto?) {
        self.data = data
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try? values.decodeIfPresent(UserResponseDto.self, forKey: .data)
    }
}
