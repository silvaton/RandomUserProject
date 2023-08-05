//
//  UserInfoListView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import SwiftUI

struct UserInfoListView: View {
    @StateObject private var viewModel = UserInfoListViewModel()
    @State private var searchText = ""
    
    var filteredUsers: [UserModel] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter {
                $0.name?.firstName?.localizedCaseInsensitiveContains(searchText) == true ||
                $0.name?.lastName?.localizedCaseInsensitiveContains(searchText) == true ||
                $0.email?.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
            
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                } else {
                    List {
                        ForEach(filteredUsers, id: \.id) { user in
                            Text(user.name?.firstName ?? "")
                        }
                        .onDelete(perform: onDelete)
                    }
                }
            }
        }
        .padding()
        .onAppear{
            viewModel.fetchData()
        }
    }
    
    private func onDelete(at offsets: IndexSet) {
        offsets.forEach { index in
            if index < filteredUsers.count {
                let userToDelete = filteredUsers[index]
                if let originalIndex = viewModel.users.firstIndex(of: userToDelete) {
                    viewModel.removeUser(at: originalIndex)
                }
            }
        }
    }
}

struct UserInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoListView()
    }
}
