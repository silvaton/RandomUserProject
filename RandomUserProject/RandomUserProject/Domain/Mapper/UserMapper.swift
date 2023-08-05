//
//  UserMapper.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public class UserMapper: Mapper<UserResponseDto, UserModel> {
    public override func mapvalue(response: UserResponseDto) -> UserModel {
        return UserModel(name: NameModel(firstName: response.name?.first,
                                         lastName: response.name?.last),
                         email: response.email,
                         profilePicture: ImageModel(largeSize: response.picture?.large,
                                                    mediumSize: response.picture?.medium,
                                                    thumbnail: response.picture?.thumbnail),
                         phone: response.phone)
    }
}
