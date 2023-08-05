//
//  ImageDto.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct ImageDto: Codable {
    public let large: String?
    public let medium: String?
    public let thumbnail: String?
    
    private enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
    
    public init(large: String?,
                medium: String?,
                thumbnail:String?) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        large = try? values.decodeIfPresent(String.self, forKey: .large)
        medium = try? values.decodeIfPresent(String.self, forKey: .medium)
        thumbnail = try? values.decodeIfPresent(String.self, forKey: .thumbnail)
    }
}
