//
//  UserMapper.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public class UserMapper: Mapper<UserResponseDto, UserModel> {
    public func mapValue(response: [UserResponseDto]) -> [UserModel]? {
        var userList = [UserModel]()
        
        response.forEach { userInfo in
            let newUser = UserModel(id: userInfo.login?.uuid,
                                    username: userInfo.login?.username,
                                    name: NameModel(firstName: userInfo.name?.first,
                                                    lastName: userInfo.name?.last),
                                    email: userInfo.email,
                                    profilePicture: ImageModel(largeSize: userInfo.picture?.large,
                                                               mediumSize: userInfo.picture?.medium,
                                                               thumbnail: userInfo.picture?.thumbnail),
                                    phone: userInfo.phone)
            
            userList.append(newUser)
        }
        
        return userList
    }
}
