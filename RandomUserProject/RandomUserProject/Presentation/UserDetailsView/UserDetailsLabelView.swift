//
//  UserDetailsLabelView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 6/8/23.
//

import SwiftUI

struct UserDetailsLabelView: View {
    let labelTitle: String
    let labelContent: String
    var body: some View {
        HStack{
            Text("\(labelTitle):")
            Text(labelContent)
        }
        .font(.callout)
        .lineLimit(1)
    }
}

struct UserDetailsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsLabelView(labelTitle: "Name", labelContent: "Tom Jobim")
    }
}
