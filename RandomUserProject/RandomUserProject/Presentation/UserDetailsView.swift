//
//  UserDetailsView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 6/8/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserDetailsView: View {
    let userInfo: UserModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if let imageURL = userInfo.profilePicture?.defaultImageUrl {
                    WebImage(url: URL(string: imageURL))
                        .resizable()
                        .placeholder(Image(systemName: "face.smiling"))
                        .frame(maxWidth: geometry.size.width * 0.4, maxHeight: geometry.size.height * 0.3)
                        .cornerRadius(5)
                        .padding()
                        .clipped()
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name:")
                        Text(userInfo.name?.userFullName ?? "")
                    }
                    HStack {
                        Text("Username:")
                        Text(userInfo.username ?? "")
                    }
                    HStack {
                        Text("Email:")
                        Text(userInfo.email ?? "")
                    }
                    HStack {
                        Text("Phone:")
                        Text(userInfo.phone ?? "")
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(userInfo: UserModel(id: "91fc228a-f81c-492e-8297-44f9b631540a",
                                            username: "heavyswan211",
                                            name: NameModel(firstName: "Nelmo",
                                                            lastName: "Pereira"),
                                            email: "nelmo.pereira@example.com",
                                            profilePicture: ImageModel(largeSize: "https://randomuser.me/api/portraits/men/84.jpg",
                                                                       mediumSize: "https://randomuser.me/api/portraits/med/men/84.jpg",
                                                                       thumbnail: "https://randomuser.me/api/portraits/thumb/men/84.jpg"),
                                            phone: "(85) 7685-6288"))
    }
}
