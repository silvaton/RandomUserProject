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
                        .frame(maxWidth: geometry.size.width * Constants.imageWidthRatio,
                               maxHeight: geometry.size.height * Constants.imageHeightRatio)
                        .cornerRadius(Constants.imageCornerRadius)
                        .padding()
                        .clipped()
                }
                VStack(alignment: .leading) {
                    
                    UserDetailsLabelView(labelTitle: "user_details_view_name_label_title".localized,
                                         labelContent: userInfo.name?.userFullName ?? "")
                    UserDetailsLabelView(labelTitle: "user_details_view_username_label_title".localized,
                                         labelContent: userInfo.username ?? "")
                    UserDetailsLabelView(labelTitle: "user_details_view_email_label_title".localized,
                                         labelContent: userInfo.email ?? "")
                    UserDetailsLabelView(labelTitle: "user_details_view_phone_label_title".localized,
                                         labelContent: userInfo.phone ?? "")
                }
                Spacer()
            }
            .navigationTitle("user_details_view_navigation_title".localized)
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // MARK: - Constants
    private enum Constants {
        static let imageHeightRatio = 0.25
        static let imageWidthRatio = 0.4
        static let imageCornerRadius = 5.0
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
