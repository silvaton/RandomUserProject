//
//  UserListInfoLabelView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 6/8/23.
//

import SwiftUI

struct UserListInfoLabelView: View {
    let labelTitle: String
    let labelContent: String
    var body: some View {
        HStack{
            Text("\(labelTitle):")
            Text(labelContent)
        }
        .font(.footnote)
        .lineLimit(1)
    }
}

struct UserListInfoLabelView_Previews: PreviewProvider {
    static var previews: some View {
        UserListInfoLabelView(labelTitle: "email", labelContent: "nelmo.pereira@example.com")
    }
}
