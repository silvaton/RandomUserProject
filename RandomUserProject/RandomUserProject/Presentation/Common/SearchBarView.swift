//
//  SearchBarView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("search_placeholder_title".localized, text: $searchText)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 15)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
