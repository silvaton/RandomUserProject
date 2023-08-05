//
//  UserResponseListDto.swift.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct UserResponseListDto: Decodable {
    public var results: [UserResponseDto]?
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
    
    public init(results: [UserResponseDto]?) {
        self.results = results
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try? values.decodeIfPresent([UserResponseDto].self, forKey: .results)
    }
}
