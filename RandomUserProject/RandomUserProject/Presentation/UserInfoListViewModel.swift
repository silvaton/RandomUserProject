//
//  UserInfoListViewModel.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Combine
import SwiftUI


class UserInfoListViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var blackListedUsersIDs: [String] = []
    @Published var errorMessage: String = ""
    @Published var isLoading = false
    @Published var shouldReloadData = true
        
    private let network = Network()
    
    func fetchData() {
        if shouldReloadData {
            shouldReloadData = false
            isLoading = true
            network.fetchData { [weak self] result in
                guard let self  = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let users):
                    updateUsersData(users: users)
                case .failure(let error):
                    self.users = []
                    if let errorInfo = error as NSError?, let message = errorInfo.userInfo[NSLocalizedDescriptionKey] as? String {
                        self.errorMessage = message
                    } else {
                        self.errorMessage = "Unknown Error"
                    }
                }
            }
        }
    }
    
    private func updateUsersData(users: [UserModel]) {
        var uniqueUsers: [String: UserModel] = [:]
        
        for user in users {
            if let userId = user.id {
                if uniqueUsers[userId] == nil {
                    uniqueUsers[userId] = user
                }
            }
        }
        
        let sortedUsers = uniqueUsers.values.sorted { (user1, user2) -> Bool in
            // Sort based on the user's name (firstName + lastName)
            let name1 = (user1.name?.firstName ?? "") + (user1.name?.lastName ?? "")
            let name2 = (user2.name?.firstName ?? "") + (user2.name?.lastName ?? "")
            return name1 < name2
        }

        DispatchQueue.main.async {
            self.users = sortedUsers
            self.errorMessage = ""
        }
    }
    
    func removeUser(at Index: Int) {
        users.remove(at: Index)
    }
    
    func isUserBlackListed(userID: String) -> Bool {
        return blackListedUsersIDs.contains(userID)
    }
    
    func addToBlackList(userID: String) {
        if !blackListedUsersIDs.contains(userID) {
            blackListedUsersIDs.append(userID)
        }
    }
    
    func removeFromBlacklist(userID: String) {
        if let index = blackListedUsersIDs.firstIndex(of: userID) {
            blackListedUsersIDs.remove(at: index)
        }
    }
}

