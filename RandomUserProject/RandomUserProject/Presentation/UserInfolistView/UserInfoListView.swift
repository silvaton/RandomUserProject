//
//  UserInfoListView.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import SwiftUI
import SDWebImageSwiftUI


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
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("user_info_list_view_progress_view_title".localized)
                        .padding()
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                } else {
                    VStack {
                        SearchBarView(searchText: $searchText)
                        List {
                            ForEach(filteredUsers, id: \.id) { user in
                                NavigationLink {
                                    UserDetailsView(userInfo: user)
                                } label: {
                                    HStack{
                                        UserInfoListImageView(user: user,
                                                              isUserBlackListed: viewModel.isUserBlackListed(userID: user.id ?? ""))
                                        VStack(alignment: .leading) {
                                            
                                            UserListInfoLabelView(labelTitle: "user_info_list_view_name_label_title".localized,
                                                                  labelContent: user.name?.userFullName ?? "")
                                            UserListInfoLabelView(labelTitle: "user_info_list_view_email_label_title".localized,
                                                                  labelContent: user.email ?? "")
                                            UserListInfoLabelView(labelTitle: "user_info_list_view_phone_label_title".localized,
                                                                  labelContent: user.phone ?? "")
                                        }
                                    }
                                }
                                .listRowSeparator(.hidden)
                            }
                            .onDelete(perform: onDelete)
                        }

                    }
                    .navigationTitle("user_info_list_view_navigation_title".localized)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                viewModel.shouldReloadData = true
                                viewModel.fetchData()
                            } label: {
                                Label("user_info_list_view_reload_data_button_title".localized,
                                      systemImage: "user_info_list_view_reload_data_button_image_title".localized)
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
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
