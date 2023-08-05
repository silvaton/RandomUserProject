//
//  UserModel.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct UserModel: Decodable, Equatable {
    public let id: String?
    public let username: String?
    public let name: NameModel?
    public let email: String?
    public let profilePicture: ImageModel?
    public let phone: String?
    
    public init(id: String?,
                username: String?,
                name: NameModel?,
                email: String?,
                profilePicture: ImageModel?,
                phone: String?) {
        self.id = id
        self.username = username
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
        self.phone = phone
    }
    public static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
}
