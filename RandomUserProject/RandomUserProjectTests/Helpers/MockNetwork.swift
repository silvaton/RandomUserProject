//
//  MockNetwork.swift
//  RandomUserProjectTests
//
//  Created by Ton Silva on 6/8/23.
//

import Foundation
@testable import RandomUserProject
class MockNetwork: Network {
    var shouldSucceed: Bool = true
    
    override func fetchData(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        if shouldSucceed {
            let mockUsers: [UserModel] = [
                UserModel(id: "91fc228a-f81c-492e-8297-44f9b631540a",
                                                    username: "heavyswan211",
                                                    name: NameModel(firstName: "Nelmo",
                                                                    lastName: "Pereira"),
                                                    email: "nelmo.pereira@example.com",
                                                    profilePicture: ImageModel(largeSize: "https://randomuser.me/api/portraits/men/84.jpg",
                                                                               mediumSize: "https://randomuser.me/api/portraits/med/men/84.jpg",
                                                                               thumbnail: "https://randomuser.me/api/portraits/thumb/men/84.jpg"),
                                                    phone: "(85) 7685-6288"),
                
                UserModel(id: "ddf2adcb-d80d-4be3-a19c-56a1d20ebdfa",
                                                    username: "heavyswan211",
                                                    name: NameModel(firstName: "Tamara",
                                                                    lastName: "Trajković"),
                                                    email: "tamara.trajkovic@example.com",
                                                    profilePicture: ImageModel(largeSize: "https://randomuser.me/api/portraits/women/80.jpg",
                                                                               mediumSize: "https://randomuser.me/api/portraits/med/women/80.jpg",
                                                                               thumbnail: "https://randomuser.me/api/portraits/thumb/women/80.jpg"),
                                                    phone: "010-8789-636")
            ]
            completion(.success(mockUsers))
            
        } else {
            let error = NSError(domain: "MockNetworkErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "Mock Network Error"])
            completion(.failure(error))
        }
    }
}
