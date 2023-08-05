//
//  UserModel.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct UserModel: Decodable {
    public let name: NameModel?
    public let email: String?
    public let profilePicture: ImageModel?
    public let phone: String?
    
    public init(name: NameModel?,
                email: String?,
                profilePicture: ImageModel?,
                phone: String?) {
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
        self.phone = phone
    }
}
