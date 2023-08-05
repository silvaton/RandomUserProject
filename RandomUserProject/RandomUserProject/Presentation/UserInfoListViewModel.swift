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
    @Published var errorMessage: String = ""
    @Published var isLoading = false
    
    private let network = Network()
    
    func fetchData() {
        isLoading = true
        network.fetchData { [weak self] result in
            guard let self  = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                    self.errorMessage = ""
                }
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
    
    func removeUser(at Index: Int) {
        users.remove(at: Index)
    }
}

