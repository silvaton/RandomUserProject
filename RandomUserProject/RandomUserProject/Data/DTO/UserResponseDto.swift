//
//  UserResponseDto.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct UserResponseDto: Decodable {
    public let name: NameDto?
    public let email: String?
    public let picture: ImageDto?
    public let phone: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case name
        case email
        case picture
        case phone
    }
    
    public init (name: NameDto?,
                 email: String?,
                 picture: ImageDto?,
                 phone: String?) {
        self.name = name
        self.email = email
        self.picture = picture
        self.phone = phone
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(NameDto.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        picture = try values.decodeIfPresent(ImageDto.self, forKey: .picture)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
    }
}
