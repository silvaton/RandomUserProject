//
//  UserInfoListImageView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 6/8/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct UserInfoListImageView: View {
    let user: UserModel
    let isUserBlackListed: Bool
    
    var body: some View {
        if let imageUrl = user.profilePicture?.defaultImageUrl {
            WebImage(url: URL(string: imageUrl))
                .resizable()
                .frame(width: 80,height: 80)
                .clipped()
                .cornerRadius(5)
                .overlay(alignment:.bottomTrailing) {
                    Image(systemName: isUserBlackListed ? "x.circle.fill" : "checkmark.seal.fill")
                        .foregroundColor(isUserBlackListed ? .red : .green)
                }
        }
    }
}

struct UserInfoListImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoListImageView(user: UserModel(id: "91fc228a-f81c-492e-8297-44f9b631540a",
                                                  username: "heavyswan211",
                                                  name: NameModel(firstName: "Nelmo",
                                                                  lastName: "Pereira"),
                                                  email: "nelmo.pereira@example.com",
                                                  profilePicture: ImageModel(largeSize: "https://randomuser.me/api/portraits/men/84.jpg",
                                                                             mediumSize: "https://randomuser.me/api/portraits/med/men/84.jpg",
                                                                             thumbnail: "https://randomuser.me/api/portraits/thumb/men/84.jpg"),
                                                  phone: "(85) 7685-6288"), isUserBlackListed: true)
    }
}
