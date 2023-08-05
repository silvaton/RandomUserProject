//
//  UserInfoListView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import SwiftUI

struct UserInfoListView: View {
    @StateObject private var viewModel = UserInfoListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.users, id: \.id) { user in
                        Text(user.name?.firstName ?? "")
                     }
                }
            }
        }
        .padding()
        .onAppear{
            viewModel.fetchData()
        }
    }
}

struct UserInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoListView()
    }
}
