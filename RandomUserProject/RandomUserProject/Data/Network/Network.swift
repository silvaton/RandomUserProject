//
//  Network.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Alamofire
import Combine
import Foundation

public class Network {
    public func fetchData(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        let url = "https://api.randomuser.me/?results=40"
        
        AF.request(url).responseDecodable(of: UserResponseListDto.self) { response in
            switch response.result {
            case .success(let userResponseList):
                if let users = UserMapper().mapValue(response: userResponseList.results ?? []) {
                    completion(.success(users))
                } else {
                    let errorInfo = NSError(domain: "Mapping Error", code: -1, userInfo: nil)
                    completion(.failure(errorInfo))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
